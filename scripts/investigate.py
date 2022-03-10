
from configparser import ConfigParser

# Path to ngspice library

import os
import math
from spice import NgSpice, NgSpiceFile
from ngspice_read import ngspice_read
import numpy as np
import pandas as pd
from optimizer import NgOptimizer
import re
import sys
from tool_box import ProcessingHelper
import xarray as xr
import pickle
import time
import ast
from transistors import plotGmIdCurves
from configparser import ConfigParser
import gc
# xr.show_versions()

def example():
    file_in='/home/simon/code/asic/analog/tia2/shahdoost.spice'
    configfile='/home/simon/code/asic/analog/tia2/shahdoost.ini'
    file_out='/home/simon/code/asic/analog/tia2/shahdoost_mod.spice'
    # Read the config file
    config = ConfigParser()
    config.read(configfile)
    parameters=config['Parameters']
    
    # Generate a list parameters to be replaced
    param={}
    for k in parameters:
        param[k]=parameters[k]
    
    # Read the file
    ngspice=NgSpice(file_in)
    # Replace the parameters
    replaceable=ngspice.findReplaceable()
    for r in replaceable:
        if not r.lower() in param.keys():
            print(f'Warning: replaceable parameter found in spice but not present in .ini {r}')
        
    ngspice.replace(param)
    
    ngspice.write(file_out)
    print (ngspice.pairs)


def operatingPoint():
    '''
    Opens the given spice file and replaces the *#OP# with statements for extracting the operating point.
    '''
    spiceFile='../analog/tia2/shahdoost_optim1_manual.spice'
    outDir='../analog/tia2/op'
    outFile=os.path.join(outDir, 'run.spice')
    if not os.path.exists(outDir):
        os.mkdir(outDir)
    
        
    ngSpiceFile=NgSpiceFile(spiceFile)
    ngSpiceFile.opExtraction(outDir)
    ngSpiceFile.write(outFile)
    

def getAdditionalCoord(simu_result):
    '''
    Returns a list of user defined dimensions. User defined dimensions are dimensions which have a 
    name different than  ['frequency', 'temp', 'model', 'mcrunno', 'spice_vector']
      
    
    :returns: one_dim_coord, param_coord
    '''
    
    EXPECTED_DIMENSIONS=['frequency', 'temp', 'model', 'mcrunno', 'spice_vector']
    
    one_dim_coord={}
    param_coord={}
    for dim in simu_result.dims:
        if not dim in EXPECTED_DIMENSIONS:
            if len(simu_result[dim])==1:
                one_dim_coord[dim]=simu_result[dim].values
            else:
                param_coord[dim]=simu_result[dim].values
    return one_dim_coord, param_coord

def setAxisFromConig(ax, config, ngvector):
    '''
    Helper function for plotting. Sets the axis properties based on configuration values.
    '''
    # If we get None as configuration, the full plot is not configured. In that case return immediately 
    if config is None:
        return ax
    
    # We expect that all vectors are configured.
    if not ngvector in config:
        raise RuntimeError('No configuration found for vector {}'.format(ngvector))
    config=config[ngvector]
    if not config is None:
        if 'ylim_top' in config: 
            ax.set_ylim(top=config['ylim_top'])
        if 'ylim_bottom' in config: 
            ax.set_ylim(bottom=config['ylim_bottom'])
        if 'title' in config: 
            ax.set_title(config['title'])
        if 'y_label' in config:
            ax.set_ylabel(config['y_label'])
    
    return ax

def plotOP(simu_result, outDir, simu_type, config):
    '''
    Generate plots for AC and NOISE analysis.
    
    The following plots are generated
    - x: frequency, y: AC analysis result, color: temperature. 
    
    '''
    from matplotlib import pyplot as plt
    print('Function plotOP')
    
    spice_vectors=simu_result['spice_vector'].values
    #temperatures=simu_result['temp'].values
    #models=simu_result['model'].values
    #freq=simu_result['frequency'].values    
    # Get rid of one dimensional coordinates 
    one_dim_coord, param_coord=getAdditionalCoord(simu_result)
    coord=one_dim_coord
    for ngvector in spice_vectors:
        fig, ax = plt.subplots()
        t=time.time()
        plot_xr=simu_result.loc[{'spice_vector': ngvector}].to_dataset(name=ngvector)
        #min_temp=min(temperatures)
        #max_temp=max(temperatures)
        plot_xr.plot.scatter(x='temp', y=ngvector, hue='model')
        #, vmin=, vmax=85
        print('Plot:', time.time()-t)
        
        #ax.set_xscale("log")
        ax.set_xlabel('Temperature / °C')  # Add an x-label to the axes.
        ax.set_ylabel(ngvector)  # Add a y-label to the axes.
        ax.set_title("{}".format(ngvector))  # Add a title to the axes.
        ax.grid()
        ax.set_ylim(bottom=0)
        # Set the axis propoerties based on the configuration
        ax=setAxisFromConig(ax, config, ngvector)
        plt.tight_layout()
        #ax.legend()  # Add a legend.
        
        #if ngvector=="v(v_vout)" or ngvector=="i(V0)":
        #    ax.set_ylim(ymin=0)
        #
        savePlot(plt, fig, simu_type, coord, ngvector, outDir)


def plotMeasurements(simu_result, outDir, simu_type, config):
    '''
    Generate plots for measurements.
    
    The following plots are generated
    - x: temperature, y: Measurement result, color: Process corner. 
    
    '''
    from matplotlib import pyplot as plt
    print('Function plotMeasurements')
    
    spice_vectors=simu_result['spice_vector'].values
    #temperatures=simu_result['temp'].values
    #models=simu_result['model'].values
    #freq=simu_result['frequency'].values    
    # Get rid of one dimensional coordinates 
    one_dim_coord, param_coord=getAdditionalCoord(simu_result)
    coord_fn=one_dim_coord
    if param_coord == {}:
        param_coord[None]=[None]
    for ngvector in spice_vectors:
        for p_k, p_v in param_coord.items():
            for v in p_v:
                fig, ax = plt.subplots()
                t=time.time()
                coord={'spice_vector': ngvector}
                if not p_k is None:
                    coord[p_k]=v
                    coord_fn[p_k]=v
                plot_xr=simu_result.loc[coord].to_dataset(name=ngvector)
                #min_temp=min(temperatures)
                #max_temp=max(temperatures)
                plot_xr.plot.scatter(x='temp', y=ngvector, hue='model')
                #, vmin=, vmax=85
                print('Plot:', time.time()-t)
                
                ax.set_xlabel('Temperature / °C')  # Add an x-label to the axes.
                ax.set_ylabel(ngvector)  # Add a y-label to the axes.
                ax.set_title("{}".format(ngvector))  # Add a title to the axes.
                # Set the axis properties based on the configuration
                ax=setAxisFromConig(ax, config, ngvector)
        
                ax.grid()
                plt.tight_layout()
                #ax.legend()  # Add a legend.
                
                #if ngvector=="v(v_vout)" or ngvector=="i(V0)":
                #    ax.set_ylim(ymin=0)
                #
                savePlot(plt, fig, simu_type, coord_fn, ngvector, outDir)

def plotAC(simu_result, outDir, simu_type, config):
    '''
    Generate plots for AC and NOISE analysis.
    
    The following plots are generated
    - x: frequency, y: AC analysis result, color: temperature. 
    
    '''
    from matplotlib import pyplot as plt
    print('Function plotAC')
    
    spice_vectors=simu_result['spice_vector'].values
    temperatures=simu_result['temp'].values
    #models=simu_result['model'].values
    #freq=simu_result['frequency'].values    
    # Get rid of one dimensional coordinates 
    one_dim_coord, param_coord=getAdditionalCoord(simu_result)
    coord=one_dim_coord
    for ngvector in spice_vectors:
        fig, ax = plt.subplots()
        t=time.time()
        plot_xr=simu_result.loc[{'spice_vector': ngvector}].to_dataset(name=ngvector)
        #min_temp=min(temperatures)
        #max_temp=max(temperatures)
        plot_xr.plot.scatter(x='frequency', y=ngvector, hue='temp', cmap='coolwarm', s=3,  alpha=0.3, cbar_kwargs={'label': 'Temperature / °C'})
        #, vmin=, vmax=85
        print('Plot:', time.time()-t)
        
        ax.set_xscale("log")
        ax.set_xlabel('Frequency / Hz')  # Add an x-label to the axes.
        ax.set_ylabel(ngvector)  # Add a y-label to the axes.
        ax.set_title("{}".format(ngvector))  # Add a title to the axes.
        # Set the axis propoerties based on the configuration
        ax=setAxisFromConig(ax, config, ngvector)
        ax.grid()
        plt.tight_layout()
        #ax.legend()  # Add a legend.
        
        #if ngvector=="v(v_vout)" or ngvector=="i(V0)":
        #    ax.set_ylim(ymin=0)
        #
        savePlot(plt, fig, simu_type, coord, ngvector, outDir)
    
def plotTran(simu_result, outDir, simu_type, config):
    '''
    Generate plots for AC and NOISE analysis.
    
    The following plots are generated
    - x: frequency, y: AC analysis result, color: temperature. 
    
    '''
    from matplotlib import pyplot as plt
    print('Function plotTran')
    
    spice_vectors=simu_result['spice_vector'].values
    temperatures=simu_result['temp'].values
    #models=simu_result['model'].values
    #freq=simu_result['frequency'].values    
    # Get rid of one dimensional coordinates 
    one_dim_coord, param_coord=getAdditionalCoord(simu_result)
    coord=one_dim_coord
    for ngvector in spice_vectors:
        fig, ax = plt.subplots()
        t=time.time()
        plot_xr=simu_result.loc[{'spice_vector': ngvector}].to_dataset(name=ngvector)
        #min_temp=min(temperatures)
        #max_temp=max(temperatures)
        plot_xr.plot.scatter(x='time', y=ngvector, hue='temp', cmap='coolwarm', s=3,  alpha=0.3, cbar_kwargs={'label': 'Temperature / °C'})
        #, vmin=, vmax=85
        print('Plot:', time.time()-t)
        
        # ax.set_xscale("log")
        ax.set_xlabel('Time / s')  # Add an x-label to the axes.
        ax.set_ylabel(ngvector)  # Add a y-label to the axes.
        ax.set_title("{}".format(ngvector))  # Add a title to the axes.
        # Set the axis propoerties based on the configuration
        ax=setAxisFromConig(ax, config, ngvector)
        ax.grid()
        plt.tight_layout()
        #ax.legend()  # Add a legend.
        
        #if ngvector=="v(v_vout)" or ngvector=="i(V0)":
        #    ax.set_ylim(ymin=0)
        #
        savePlot(plt, fig, simu_type, coord, ngvector, outDir)
            

def savePlot(plt, fig, simu_type, coord, ngvector, outDir):
    '''
    Saves the plot. Used by plotAC, plotMeasurements etc. to avoid redundant code.  
    '''
    t=time.time()
    fname_base="{}_".format(simu_type)
    for k, v in coord.items():
        fname_base+="{}_{}_".format(k, v)
    fname_base+="{}".format(ngvector)
    
    file=os.path.join(outDir, fname_base+".svg")
    image_format = 'svg' # e.g .png, .svg, etc.
    #fig.savefig(file, format=image_format, dpi=1200)
    file=os.path.join(outDir, fname_base+".png")
    file_small=os.path.join(outDir, fname_base+"_small.png")
    image_format = 'png' # e.g .png, .svg, etc.
    fig.savefig(file, format=image_format, dpi=1200)
    
    fig.savefig(file_small, format=image_format, dpi=300)
    plt.close(fig)
    print('Save plot:', time.time()-t)

def investigateCorners(workingDir, spiceFile, voltages, corners, maxCpu, plot_config=None, param={}, mc=True):
    '''
    Replaces #model# by the name of a simulation model and investigates the corners.
    
    
    '''
    
    # Operating voltages

    # Typically troublesome corners
    #corners=["tt"]#""sf", "tt", "fs"]
    # Device mismatch corners
    if mc:
        corners_mm=[c+'_mm' for c in corners]
    
    run=True
     
    # Run spice
    ngspice_instances=[]
    for voltage in voltages:
        outDir=os.path.join(workingDir, 'corners_{}V'.format(voltage))
        if not os.path.exists(outDir):
            os.mkdir(outDir)
        spiceParam=param
        spiceParam['model']=corners_mm
        spiceParam['UB']= voltage        
         
        # Run spice
        
        #xr_file="ngspice_small_v{}.xr".format(voltage)
        pickleFile="ngspice_rawres_v{}.pickle".format(voltage)
        pickleFile=os.path.join(workingDir, pickleFile)
        ngspice=NgSpice(spiceFile, outDir, parallel=True, max_cpus=maxCpu)
        if run: 
            result=ngspice.run(spiceParam, delete=True)
            ngspice.savePickle(pickleFile)
               
        else:
            ngspice.loadPickle(pickleFile)    
            
        ngspice_instances.append(ngspice)
    
    # Convert to xarray
    # We limit ourselves to 4 cores to not use excessive memory
    p=ProcessingHelper(parallel=True, maxCpu=4)
    for ngspice in ngspice_instances:
        p.add(ngspice.getResultAsDataArray, [])
    results_xr=p.run()
    
    # Free memory
    for ngspice in ngspice_instances:
        del ngspice
    del ngspice_instances
    gc.collect()
        
    # Plot
    # We limit ourselves to 4 cores to not use excessive memory
    # TODO: use multiprocessing.shared_memory to make out xarrays accessible to all 
    # processes, this should enable a significant speedup.
    p=ProcessingHelper(parallel=True, maxCpu=4)
    for result_xr in results_xr:
        if False:
            pickleFileXr="ngspice_small_xr_v{}.pickle".format(voltage)
            if run: 
                with open(pickleFileXr, 'wb') as file:
                    pickle.dump(result_xr, file)
            else:
                with open(pickleFile, 'rb') as file:
                    result_xr=pickle.load(file)
                    
        # Plot measurements
        for simu_type in result_xr.keys():
            for simu_name in result_xr[simu_type]:
                print(simu_type, simu_name)
                simu_result=result_xr[simu_type][simu_name]
                outDir="{}_{}".format(simu_type, simu_name)
                if not outDir.lower() in plot_config:
                    raise(RuntimeError('Plot configuration missing for {}'.format(outDir.lower())))
                config_thisplot=plot_config[outDir.lower()]
                outDir=os.path.join(workingDir, outDir)
                if not os.path.exists(outDir):
                    os.mkdir(outDir)
                if simu_type.upper() == 'MEAS':
                    p.add(plotMeasurements, [simu_result, outDir, simu_type, config_thisplot])
                elif simu_type.upper() == 'AC':
                    p.add(plotAC, [simu_result, outDir, simu_type, config_thisplot])
                elif simu_type.upper() == 'NOISE':
                    p.add(plotAC, [simu_result, outDir, simu_type, config_thisplot])
                elif simu_type.upper() == 'OP':
                    p.add(plotOP, [simu_result, outDir, simu_type, config_thisplot])
                elif simu_type.upper() == 'TRAN':
                    p.add(plotTran, [simu_result, outDir, simu_type, config_thisplot])
                else:
                    raise(RuntimeError('Unrecognized simulation type {}'.format(simu_type)))

        #result_ds=xr.Dataset.from_dict(result_xr)
        #result_xr=result_ds.to_dict()
        
        # xr_list=[]
        # xr_file_list=[]
        # for simu_type in result_xr.keys():
        #     for simu_name in result_xr[simu_type]:        
        #         xr_file="ngspice_{}_{}_v{}.xr".format(simu_type, simu_name, voltage)
        #         xr_file=os.path.join(workingDir, xr_file)
        #         xr_file_list.append(xr_file)
        #         result_ds=result_xr[simu_type][simu_name].to_dataset(name=f"{simu_type}_{simu_name}")
        #         xr_list.append(result_ds)
        #
        # xr.save_mfdataset(xr_list, xr_file_list)
        #
        #
        # for simu_type in result_xr.keys():
        #     for simu_name in result_xr[simu_type]:        
        #         xr_file="ngspice_{}_{}_v{}.xr".format(simu_type, simu_name, voltage)
        #         xr_file=os.path.join(workingDir, xr_file)
        #         xr_file_list.append(xr_file)
        #         result_ds=result_xr[simu_type][simu_name].to_dataset(name=f"{simu_type}_{simu_name}")
        #         xr_list.append(result_ds)
        #
        # xr.save_mfdataset(xr_list, xr_file_list)
        #
        
    print('Now starting parallel plotting')         
    p.run()
    print("Done!")

class AcSimulationResult:
    '''
    Provides access to AC simulation results and helper functions for plotting.
    '''
    def __init__(self, simulationResult):
        '''
        :param simulationResult.
        '''
        pass
    
    def getParameters(self):
        '''
        Returns the parameters supplied to the simulation as data frame. This also includes the temperature.  
        '''
        pass
    
    def getReslutByParameter(self):
        pass       
    
def main_raw():
    file='../analog/transistors/test_nmos3.raw'
    ngread=ngspice_read(file)
    print('Breakpoint')
    

def test_tia():
        workingDirBase='../analog/test/'
        # spiceFile=os.path.join(workingDir, 'test_bandgap_mc.spice')
        spiceFile=os.path.join(workingDirBase, 'test_tia_rgc_full_mc.spice')
        darkcur = [-5e-6, -2.5e-6, 0, 2.5e-6, 5e-6]
        #, -2.5e-6, 0, 2.5e-6, 5e-6]
        # for darkcur in [-5e-6, -2.5e-6, 0, 2.5e-6, 5e-6]:
        param={'ID': darkcur}
        workingDir= os.path.join(workingDirBase, 'wd')
        if not os.path.exists(workingDir):
            os.mkdir(workingDir)
        investigateCorners(workingDir, spiceFile, param)

def investigateIni():
    '''
    Investigate corners using parameters given in an ini file.
    '''
    if len(sys.argv) != 2:
        print('Wrong arguments. Usage: investigate.py iniFile.')
        quit()
    
    parser=ConfigParser()
    parser.read(sys.argv[1])
    # Read files section and assemble pathes
    baseDir=ast.literal_eval(parser['Files']['baseDirectory'])
    spiceFile=ast.literal_eval(parser['Files']['spiceFile'])
    spiceFile=os.path.join(baseDir, spiceFile)
    outDir=ast.literal_eval(parser['Files']['outputDirectory'])
    outDir= os.path.join(baseDir, outDir)
    # Read voltages and corners
    voltages=ast.literal_eval(parser['Setup']['voltages'])
    corners=ast.literal_eval(parser['Setup']['corners'])
    maxCpu=ast.literal_eval(parser['Setup']['maxCpus'])
    
    plot_config={}
    for section in parser['Plot']:
        value=parser['Plot'][section]
        plot_config[section]=ast.literal_eval(value)
    
    # Create the output directory
    if not os.path.exists(outDir):
        os.mkdir(outDir)
    
    param={}
    for k,v in parser['Parameter'].items():
        param[k.upper()]=ast.literal_eval(v)
        
    investigateCorners(outDir, spiceFile, voltages, corners, maxCpu, plot_config,  param)
    print('Done')
    
    

def test_iref():
        mode='OP'
        workingDirBase='../analog/test/'
        # spiceFile=os.path.join(workingDir, 'test_bandgap_mc.spice')
        spiceFile=os.path.join(workingDirBase, 'test_low_pvt_source_mc.spice')
        workingDir= os.path.join(workingDirBase, 'isource')
        if not os.path.exists(workingDir):
                os.mkdir(workingDir)
        investigateCorners(workingDir, spiceFile, mode)


if __name__ == "__main__":

    investigateIni()
    #task='MC'
    #
    #if task == 'MC':
    # test_iref()
    #test_tia()
        #MODE='OP'
    # elif task == 'plotOP':
    #     TRANSISTOR_TYPES=['nfet_01v8_lvt', 'pfet_01v8_lvt', 'pfet_01v8_hvt', 'nfet_01v8', 'pfet_01v8']
    #     for t in TRANSISTOR_TYPES:
    #         plotGmIdCurves(t, 0.4)
            
    #operatingPoint()
    # optimize2()
