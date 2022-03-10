import os
import subprocess
from subprocess import PIPE
from multiprocessing import Pool, cpu_count
import shutil
import re
import pandas as pd
from multiprocessing import Lock
import hashlib
import math
import xarray as xr
import numpy as np
import time
import pickle
class SpiceAnalysis():
    def __init__(self):
        pass
        
        
class RawFile():
    '''
    Read the given ngspice .raw file
    '''
    def __init__(self, file):
        pass
    
class NgSpiceFile():
    '''
    Reading and modifying an ngspice file
        
    '''
    def __init__(self, file):
        self.spice=[]
        self.file=file
        self.paramPairs={}
        self.commandBlPairs={}
        with open(self.file, 'r') as myfile:
            for line in myfile:
                self.spice.append(line)

    def findReplaceable(self):
        '''
        Searches the file for replaceable parameters. 
        Replaceable parameters are characterized by a name enclosed in # without spaces. E.g. #Name#
        Note: The name #OP# is reserved. It must not be used and will be ignored.
         
        '''
        result=[]
        for line in self.spice:
            candidate=line.split('#')
            for i, c in enumerate(candidate):
                # The first candidate in a line is not valid 
                if i == 0:
                    continue
                # OP is not a valid candidate
                if c == 'OP':
                    continue
                if not ' ' in c and not '\n' in c:
                    result.append(c)
        return result

    def opExtraction(self, directory):
        '''
        Replaces the keyword *#OP# with a block saving information about operating point of all transistors including capacitances.
        Make sure the have an OP statement before the keyword *#OP#. Also, *#OP# must be part of a control block.  
        
        :param directory: Directory into which the operating point information should be written.
        '''
        
        EXTRACT_PARAM=["vds", "gm", "vth", "vgs", "id", "gds", "cgg", "cgs", "cgd", "cgb", "cdg", "cds", "cdd", "cdb", "csg", "css", "csd", "csb", "cbg", "cbs", "cbd", "cbb"]
        
        transistors = self._getTransistorModelNames()
        
        # Generate the string for
    
        string = ""
        for name, model in transistors.items():
            outfile=os.path.join(directory, f"op_{name}.csv")
            subString="wrdata {} ".format(str(outfile))
            for param in EXTRACT_PARAM: 
                subString+="@m.{}.m{}[{}] ".format(name.lower(), model, param) 
            
            string += f"{subString}\n"
 
        self.commandBlPairs["*#OP#"] = string
                   
    def _getTransistorModelNames(self):
        '''
        Returns a list of the model names of transistors. Note: This only works for SK130A for now as we search for sky130 in the model name.
        
        '''
        result={}
        for line in self.spice:
            candidate=line.split(' ')
            # Check if the name contains XM which stands for transistor
            #print(candidate[0][:2])
            if candidate[0][:2] == 'XM':
                for c in candidate:
                    #print(c[:6])
                    # Model names contain "sky130" at the beginning. Find the model name.
                    if c[:6] == "sky130":
                        result[candidate[0]] = c 
                        
        return result
                            
    def replace(self, pairs, keepOld=False):
        '''
        Replace the replaceable parameters 
        
        :param pairs: Dictionary, They key is the name of the replaceable parameters. The value the value to be written to the output file.
        :type pairs: dict 
        '''
        
        replaceable=self.findReplaceable()
        # 
        if not keepOld: self.paramPairs={}
            
        for k, v in pairs.items():
            if not k in replaceable:
                raise(RuntimeError(f'Cannot replace {k}. {k} not found in spice file'))
            self.paramPairs[k] = v

    def write(self, file):
        '''
        Writes out the modified spice file. The file is written to the rundir given when instatiating the class.
        
        :param 
        
        '''
        
        # Check if we have parameters for all replaceable strings in the spice file.
        replaceable=self.findReplaceable()
        for r in replaceable:
            if not r in self.paramPairs.keys():
                raise(RuntimeError(f'No value found for {r}. Please provide values for all replaceable strings.'))
            
        self.outfile=file
        #outfile=os.path.join(self.rundir, file)
        
        outspice=[]
        for line in self.spice:
            # Replace the parameters 
            for k,v in self.paramPairs.items():
                line=line.replace('#'+k+'#', str(v))
            
            # Replace command blocks
            for k,v in self.commandBlPairs.items():
                line=line.replace(k, v)
                        
            outspice.append(line)
        
        # Write to file.
        with open(self.outfile, 'w') as outfile:
            for line in outspice:
                outfile.write(line)
                
def splitNgspiceFileName(fileName):
    '''
    Splits the file name returned by ngspice into it's parts.
    
    Please follow the following naming scheme:
    result_type_name_temperature_mcrunno.csv
    In detail:
    
    - "result": Constant. Must be present for :py:class:`Ngspice` to recognize the file. 
    - "type": Currently allowed are "AC", "NOISE", "MEAS".
    - "name": You might want to have multiple simulations of the same type. You can distinguish them by name.
    - "temperature": The temperature followed by deg. E.g. 80deg.  
    - "mcrunno": Number of the monte carlo run.
    
    :returns: type, name, temperature, mcrunno 
    '''
    try:
        # Remove extension
        fileName=os.path.splitext(fileName)[0]
        fileName_split=fileName.split('_')
        simu_type=fileName_split[1]
        simu_name=fileName_split[2]
        simu_temp=re.findall('[0-9]*deg', fileName_split[3])
        simu_temp=re.findall('[0-9]*', simu_temp[0])
        simu_temp=int(simu_temp[0])
        #mcrunno=fileName_split[4].split('.')    
        mcrunno=int(fileName_split[4])
    except:
        print('Failed to parse file name {}'.format(fileName))
        raise
    
    return simu_type, simu_name, simu_temp, mcrunno

    
class NgSpice():
    '''
    Enables investigation of a parameter space using parallel processes of ngspice.     
    
    Concept and usage: 
        * In the spice file mark parameters to be altered with #Name#. 
        * In the spice file mark the position at which the operating point should be saved with "*#OP#".
        * In the spice file write results to .csv files. The filename has to comply with the convetions defined in :py:func:`splitNgspiceFileName`
        * Instantiate this class for the given spice file. You can then call :py:meth:`setParameterSpace` to replace the parameters to be altered.
    
    '''
    def __init__(self, file, rundir, parallel=True, max_cpus=24):
        '''
        :param rundir: Directory used for temporary storage.
        :param file: Spice file.
        :param parallel: Optional. Defaults to True. Set to false to disable processing on multiple cpus.
        :param max_cpus: Maximum number of CPUs to be used. Defaults to 24. 
        
        '''
        self.rundir=rundir
        self.file=file
        #self.includeFiles=includeFiles
        self.constantPairs={}
        
        self.ngspiceFile = file 
        self.parallel=parallel
        self.folderOffset=0
        self.simulation_result=None
        self.max_cpus=max_cpus
    # This is obsolete. The function is coverd by spiceParam.   
    # def setConstants(self, pairs, keepOld):
    #     '''
    #     Sets the parameters to be replaced by constants. 
    #
    #     :param pairs: Dictionary, They key is the name of the replaceable parameters. The value the value to be written to the output file.
    #     :type pairs: dict 
    #     '''
    #     if not keepOld: self.pairs={}
    #
    #     for k, v in pairs.items():
    #         self.constantPairs[k] = v
    #

    def getFileHash(self):
        '''
        Returns a hash for the spice file.
        
        '''
        hash=hashlib.sha1()
        
        with open(self.ngspiceFile) as file:
            for line in file:
                hash.update(line.encode('utf-8'))
                
        return hash.hexdigest()

    def getResultAsDataArray(self):
        '''
        Groups the results from :py:meth:`Ngspice.run` by simulation type and converts the results
        to a big dataframe.
        
        The function :py:meth:`Ngspice.run` returns a list of simulation results. 
        The results may stem from AC analysis, OP calculation, measurements, etc. 
        The results are also not organized in a very handy form.   
        
        This function will group the results by measurement type. Since there is no easy way to infer
        the type of simulation from the results you must provide the type of data via the file 
        name generated by ngspice.
            
        :returns: {"type": {"name": xarray}} 
            
        '''
        # Our simulation result is multidimensional. We use xarrays to store the data.
        # Uppon creation of the array we need to know the exact size of the array.
        # Some dimensions are known from spiceParam. Others, in particular temperature need to be 
        # inferred from the simulation results. Therefore we iterate over our simulation results twice.
        # Firstly we extract the parameters given to the simulation from within ngspice.
        # Secondly we initialize fill the xarray, then we fill the xarray.  
         
        if self.simulation_result is None:
            raise(RuntimeError('You must run a simulation first'))
        
        simulationResult=self.simulation_result
        spiceParam=self.spiceParam
        # Fill params from simulation results
        param={}
        t=time.time()
        simulationResultNext=[]
        for res in simulationResult:
            # Iterate over the results of a simulation run.
            keepResult=True
            for fileName, simu_result in zip(res['resultFiles'], res['results']) :
                # Get the type and name of the simulation
                simu_type, simu_name, simu_temp, mcrunno=splitNgspiceFileName(fileName)
                # Check if the type has already been added if not initialize
                # TODO: Consider doing some sanity check on simulation types.
                # We might want to reduce the amount of data stored for measurements.
    
                if not simu_type in param:
                    param[simu_type]={}
                    
                # Check if the name has already been added if not initialize
                if not simu_name in param[simu_type]:
                    param[simu_type][simu_name]={'temp':[], 'mcrunno':[]}
                    # Add frequencies
                    columns=list(simu_result.columns)
                    if 'frequency' in columns:
                        param[simu_type][simu_name]['frequency']=simu_result['frequency'].values
                        columns.remove('frequency')    
                    # Same with time
                    if 'time' in columns:
                        param[simu_type][simu_name]['time']=simu_result['time'].values
                        columns.remove('time')    
                    
                    
                    # Add spice vectors
                    param[simu_type][simu_name]['spice_vector']=columns
                    
                # See if the temperature is already listed 
                if not simu_temp in param[simu_type][simu_name]['temp']:
                    param[simu_type][simu_name]['temp'].append(simu_temp)
                    
                # See if the mcrunno is already listed-
                # Note: Some run numbers might be skipped sometimes.
                # This way we get all unique numbers. 
                if not mcrunno in param[simu_type][simu_name]['mcrunno']:
                    param[simu_type][simu_name]['mcrunno'].append(mcrunno)        
    
                # Ensure frequencies match. 
                if 'frequency' in simu_result.columns:
                    freq_saved= param[simu_type][simu_name]['frequency']
                    freq_this_result = simu_result['frequency'].values
                    if not np.array_equal(freq_saved,freq_this_result):
                        raise(RuntimeError("Frequencies don't match. Something went wrong."))
                
                # Remove additional points from time axis for transient simulation  
                if 'time' in simu_result.columns:
                    time_saved= param[simu_type][simu_name]['time']
                    time_this_result = simu_result['time'].values
                    if not np.array_equal(time_saved,time_this_result):
                        time_intersect=np.msort(np.union1d(time_saved, time_this_result))
                        param[simu_type][simu_name]['time']=time_intersect
                    
                print('Assemble parameter space:', time.time()-t )
            
            #
            if keepResult:
                simulationResultNext.append(res)
        # Fill params from spiceParam and 
        # compute the dimensions from params
        for simu_type in param.keys():
            for simu_name in param[simu_type].keys():
                # Fill params from spiceParam
                for key, value in spiceParam.items():
                    # Convert floats or integers to lists, as required by xarray.
                    # TODO: We might need to convert more data types.
                    if type(value) == float or type(value) == int:
                        value=[value]
                    param[simu_type][simu_name][key]=value
    
        # Iterate over simulation runs and fill the xarray.
        # One simulation run is one invocation of ngspice.
        result={}
        t=time.time()
        t_fill=0
        for res in simulationResultNext:
            # Iterate over the results of a simulation run.
            simu_param=res['param']
            for fileName, simu_result in zip(res['resultFiles'],res['results']) :
                # Get the type and name of the simulation
                simu_type, simu_name, simu_temp, mcrunno=splitNgspiceFileName(fileName)
                             
                if not simu_type in result:
                    result[simu_type]={}
                    
                # Check if we already encountered another run of the simulation.
                # If this is the first time we come across the simulation, initialize the 
                # xarray.
                if not simu_name in result[simu_type]:
                    coords=param[simu_type][simu_name]
                    dims=param[simu_type][simu_name].keys()
                    result[simu_type][simu_name]=xr.DataArray(None, coords=coords, dims=dims)
                            
                # Assemble our current coordinates :)
                # Frequency and spice vectors are treated separately.
                t1=time.time()
                coord=simu_param
                coord['temp']=simu_temp
                coord['mcrunno']=mcrunno
                columns=list(simu_result.columns)
                # Attach the frequency to the coordinates
                #if simu_type=='op':
                #    print('Breakpoint')
                if 'frequency' in columns:
                    columns.remove('frequency')
                    frequency=simu_result['frequency'].values
                    coord['frequency']=frequency
                else:
                    if 'frequency' in coord:
                        coord.pop('frequency')
                
                # Handle time in transient simulations
                if 'time' in columns:
                    columns.remove('time')
                    time_param=coords['time']
                    time_simu=simu_result['time']
                else:
                    time_param=None
                    
                # Attach the data to the array.
                for column in columns:
                    coord['spice_vector']=column
                    values=simu_result[column].values
                    if len(values) == 1:
                        values=values[0]
                    try:
                        if time_param is None:
                            result[simu_type][simu_name].loc[coord]=values
                        elif np.array_equal(time_param, time_simu):
                            result[simu_type][simu_name].loc[coord]=values
                        else:
                            i=0
                            val=np.empty_like(time_param)
                            for j, tp in enumerate(time_param):
                                ts= time_simu[i]
                                if tp == ts:
                                    val[j]=values[i]
                                    i+=1
                                else:
                                    val[j]=np.nan
                                
                            result[simu_type][simu_name].loc[coord]=val
                    except:
                        print(simu_type, simu_name, coord)
                        raise
                t_fill+=time.time()-t1
                
        print('Fill parameter space:', time.time()-t )
        print('xrtime:', t_fill)
        return result

    def savePickle(self, fileName):
        '''
        Stores the simulation result and the spiceParameters in a pickle file.
        ''' 
        d_out={'simulationResult': self.simulation_result, 'spiceParam':self.spiceParam}
        with open(fileName, 'wb') as file:
            pickle.dump(d_out, file)

    def loadPickle(self, fileName):
        '''
        Loads the simulation result and the spiceParameters from a pickle file.
        ''' 
        with open(fileName, 'rb') as file:
            d_out=pickle.load(file)
            
        self.simulation_result=d_out['simulationResult']
        self.spiceParam=d_out['spiceParam']

    def _spiceParamToParSpace(self, spiceParam, parSpace, spiceParamKeyList, indexParam):
        '''
        Iteratively create the parameter space for ngspice
        '''
        parSpaceNew={k: [] for k in parSpace.keys()}
        new_key=spiceParamKeyList[indexParam]
        parSpaceNew[new_key]=[]
        for new_value in spiceParam[new_key]:
            # Handle the first iteration
            if parSpace =={}:
                parSpaceNew[new_key].append(new_value)
                continue
            # All further iteration
            # Copy existing parameters 
            for key, value in parSpace.items():
                length=len(value)
                for v in value:
                    parSpaceNew[key].append(v)
            # Add new parameter
            for v in range(length):
                parSpaceNew[new_key].append(new_value)
        
        if indexParam >= len(spiceParamKeyList)-1:
            return parSpaceNew
        else:
            parSpaceNew=self._spiceParamToParSpace(spiceParam, parSpaceNew, spiceParamKeyList, indexParam+1)
        return parSpaceNew
            
    def spiceParamToParSpace(self, spiceParam):
        '''
        Create the parameter space for ngspice
        
        '''
        parSpaceDict={}
        spiceParamKeyList=list(spiceParam.keys())
        parSpaceDict=self._spiceParamToParSpace(spiceParam, parSpaceDict, spiceParamKeyList, 0)
        parSpace=pd.DataFrame(parSpaceDict)
        return parSpace

    def run(self, spiceParam, delete=False, rename={}):
        '''
        Executes ngspice. 
        
        Operations performed:
        1. In the rundir provided to __init__ a directory will be created for each row in parSpace.
        2. In the created directories, a spice file run.spice will be created for each row in parSpace.
        3. ngspice will be called executed. The terminal output will be stored in run.log 
        4. Files created by ngspice called result{}.csv (where {} is arbitrary) will be parsed as csv files and content returned.
        
        
        :param spiceParam: Dictionary. Keys are the parameters to be varies. Values are lists containing the values. 
        :param delete:
        :param replace: Optional. Dict. If given, the column names given by key in the output will be replaced by the corresponding value. This should help in making the output human readable.
        :param threadSafe: Will not overWrite existing results
        
        :returns: List. Each entry corresponds to ngspice run. 
        Each entry is a dict containing the variable parameters used for the call as well as the contents of the read result files. 
        '''
        # Convert everything to lists
        # TODO: Add more data types
        self.spiceParam={}
        for k, v in spiceParam.items():
            if type(v) == float:
                v=[v]
            self.spiceParam[k]=v
        
        # Create the parameter space for ngspice.        
        self.parSpace=self.spiceParamToParSpace(self.spiceParam)
        parSpace=self.parSpace
            
        # Generate parameter map.
        
        # Create run directories
        noInstances=parSpace.shape[0]
        print('Number of spice Instances to be started: ', noInstances)
        rundirs=[]

        # This needs to be thread safe so we can have multiple calls of run in parallel.
        for s in range(noInstances):
            # Assemble the directory name for the run.
            hash=hashlib.sha1()
            for col in parSpace.columns:
                # If we have a string encode it as utf 8 before calculating a hash. 
                # For other data types attempt to use the tobyte functions.
                # Note: This might fail for some data types.
                val=parSpace[col].values[s]
                if type(val) == str:
                    hash.update(val.encode('utf-8'))
                else:
                    hash.update(val.tobytes())
            
            dirName=hash.hexdigest()
            rundir=os.path.join(self.rundir, f'rundir_{dirName}')
            if os.path.exists(rundir):
                # If a run directory exists, delete it or give up.
                if delete:
                    shutil.rmtree(rundir)
                else:
                    raise(RuntimeError('Rundir exists.'))
            # Create the directory.
            os.mkdir(rundir)
            rundirs.append(rundir)
            
        # We instantiate NgSpiceFile at each call to be thread safe.
                
        ngspiceFile=NgSpiceFile(self.ngspiceFile)
        ngspiceFile.replace(self.constantPairs, keepOld=False)
            
        # Write spice files
        spiceFiles=[]
        paramForRes=[]
        for (_, item), rundir  in zip(parSpace.iterrows(), rundirs):
            # Set the new parameter
            param=item.to_dict()
            ngspiceFile.replace(param, keepOld=True)
            paramForRes.append(param)
            
            # Write the spice file to the output directory.
            # Spice will be run in rundir, so we need to use absolute pathes.
            spiceFile=os.path.abspath(os.path.join(rundir, 'run.spice'))
            spiceFiles.append(spiceFile)
            ngspiceFile.write(spiceFile)
        
        # A bit of cryptic code :)
        # Pool only allows one parameter to be passed to the function. So we compress the parameters to a dict.
        param=[ {'runDir':runDir, 'spiceFile':spiceFile, 'param': pForRes} for (runDir, spiceFile, pForRes) in zip(rundirs, spiceFiles, paramForRes)]
        
        # Ngspice also seems to do some multithreading. So let's split the task into batches of equal number of processes. 
        # E.g. if we have 9 spice instances we need to run don't start 8 at once and then 1 but run up to 5 in parallel, resulting in approx. 5+4 instances.
        cpus= min(cpu_count(), self.max_cpus)
        if cpus != cpu_count():
            print(f'Limiting the maximum number of processes to {cpus}. However, {cpu_count()} CPUs would be available. \n \
                Change the max_cpus if you would like to use more CPUs.')
        batches= math.ceil(noInstances/cpus)
        processes=int(math.ceil(noInstances/batches))
        
        print(f'Will need {batches} batch(es). Max processes per batch: {processes}.')
        
        # Execute ngspice    
        if self.parallel:
            p=Pool(processes=processes)
            with p as pool:
                result=pool.map(_runNgspice, param)
            del p
        else:
            result=[]
            for p in param:
                result.append(_runNgspice(p))
                
        # Rename columns to something more easily understandable than spice internal variable names
        for res in result:
            for df in res['results']:
                df.rename(columns=rename, inplace=True)
                
        self.simulation_result=result
        return result
        
def _runNgspice(param):
    '''
    Runs ngspice, to be called as part of a  multiprocessing pool
    '''
    
    # Execute ngspice in a shell, so the user can see what's happening. Also output the stdout to a file
    runDir=param['runDir']
    spiceFile=param['spiceFile']
    logfile= os.path.join(runDir, 'run.log')
    with open(logfile, 'wb') as nglog:
        with subprocess.Popen(['ngspice', '-b', f'{spiceFile}'], shell=False, cwd=runDir, stdout=PIPE) as proc:
            nglog.write(proc.stdout.read())
    
    #Search for result files
    regex=r'result.*\.csv$'
    result={'param': param['param'], 'resultFiles': [], 'results': [] }
    for root, _, files in os.walk(runDir):
        for file in files:
            m = re.match(regex, file)
            if not m is None:
                df=pd.read_csv(os.path.join(root, file), delim_whitespace=True)
                #print(df)
                result['resultFiles'].append(file)
                result['results'].append(df)
    return result
    
    
    