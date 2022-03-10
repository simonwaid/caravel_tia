import os
import pandas as pd
from spice import NgSpice

def plotGmIdCurves(transistor_type, vsb):
    from matplotlib import pyplot as plt

    #TRANSISTOR_TYPES=['nfet_01v8_lvt', 'pfet_01v8_lvt', 'pfet_01v8_hvt', 'nfet_01v8', 'pfet_01v8']
    #TRANSISTOR_TYPE='pfet_01v8'
    #TRANSISTOR_TYPE='nfet_01v8'
    TRANSISTOR_TYPE=transistor_type

    
    #file_in='/home/simon/code/asic/analog/transistors/test_nmos4.spice'
    #workingDir='/home/simon/code/asic/analog/transistors/outdata_nmos_lvt_US_0_6V'
    #workingDir='/home/simon/code/asic/analog/transistors/outdata_nmos_lvt'
    workingDir='/home/simon/code/asic/analog/transistors/'
    workingDir=os.path.join(workingDir, 'vsb_{}'.format(vsb))
    if TRANSISTOR_TYPE=='pfet_01v8':
        file_in='/home/simon/code/asic/analog/transistors/test_pmos.spice'
        workingDirT='outdata_pmos'
        l=[0.15, 0.2, 0.3, 0.5, 1, 2, 4, 6]
    if TRANSISTOR_TYPE=='pfet_01v8_lvt':
        file_in='/home/simon/code/asic/analog/transistors/test_pmos_lvt.spice'
        workingDirT='outdata_pmos_lvt'
        l=[0.35, 0.5, 1, 2, 4, 6]
    if TRANSISTOR_TYPE=='pfet_01v8_hvt':
        file_in='/home/simon/code/asic/analog/transistors/test_pmos_hvt.spice'
        workingDirT='outdata_pmos_hvt'
        l=[0.15, 0.2, 0.3, 0.5, 1, 2, 4, 6]
    if TRANSISTOR_TYPE=='nfet_01v8':
        file_in='/home/simon/code/asic/analog/transistors/test_nmos.spice'
        workingDirT='outdata_nmos'
        l=[0.15, 0.2, 0.3, 0.5, 1, 2, 4, 6]
    if TRANSISTOR_TYPE=='nfet_01v8_lvt':
        file_in='/home/simon/code/asic/analog/transistors/test_nmos_lvt.spice'
        workingDirT='outdata_nmos_lvt'
        l=[0.15, 0.2, 0.3, 0.5, 1, 2, 4, 6]
    vsb=[vsb]*len(l)
    width={'L': l, 'VSB': vsb}
    
    if not os.path.exists(workingDir):
        os.mkdir(workingDir)
    workingDir=os.path.join(workingDir, workingDirT)

    if not os.path.exists(workingDir):
        os.mkdir(workingDir)
    
        #workingDir='/home/simon/code/asic/analog/transistors/outdata_nmos'
    
    # Generate parameter map.
    df=pd.DataFrame(width)
    
    # Replace the spice specific names by something human readable  
    # nfet
    #spiceReplace={'var_vgs': 'V_GS', 'var_vdb': 'V_DS', 'i(V_ID)' : 'I_D', '@m.xm1.msky130_fd_pr__nfet_01v8[gm]': 'gm', '@m.xm1.msky130_fd_pr__nfet_01v8[gds]': 'gds'}
    # nfet_lvt
    #spiceReplace={'var_vgb': 'V_GB', 'var_vds': 'V_DS', 'i(V_ID)' : 'I_D', '@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]': 'gm', '@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]': 'gds'}
    
    spiceReplace={'var_vgb': 'V_GB', 'var_vds': 'V_DS', 'i(V_ID)' : 'I_D', f'@m.xm1.msky130_fd_pr__{TRANSISTOR_TYPE}[gm]': 'gm', f'@m.xm1.msky130_fd_pr__{TRANSISTOR_TYPE}[gds]': 'gds'}
    
    # Run spice
    ngspice=NgSpice(file_in, workingDir, parallel=True)
    try:
        result=ngspice.run(df, delete=True, rename=spiceReplace)
    except:
        print(TRANSISTOR_TYPE)
        raise
    
    
    for r in result:
        df=r['results'][0]
        u_GS_unique=df['V_GB'].unique()
        
        # First plot: For a given transistor length plot gm as a function of the Gate voltage. 
        fig, ax = plt.subplots() 
        for u_GS_filter in u_GS_unique: 
            myfilter = df['V_GB'].values == u_GS_filter   
            I_D=df['I_D'].values[myfilter] 
            gm=df['gm'].values[myfilter]    
            ax.plot(I_D, gm, label=f'U_GB={u_GS_filter}')
        ax.set_xlabel('I_D')  # Add an x-label to the axes.
        ax.set_ylabel('gm')  # Add a y-label to the axes.
        ax.set_title("Lenght={:.2f}".format(r['param']['L']))  # Add a title to the axes.
        ax.legend()  # Add a legend.
        #plt.show()
        file=os.path.join(workingDir, "gm vs ID, Lenght={:.2f}.png".format(r['param']['L']))
        plt.savefig(file)
        plt.close(fig)
        
        # Second plot: For a given transistor length plot gds as a function of the Gate voltage.
        fig, ax = plt.subplots() 
        for u_GS_filter in u_GS_unique: 
            myfilter = df['V_GB'].values == u_GS_filter   
            I_D=df['I_D'].values[myfilter] 
            gds=df['gds'].values[myfilter]
            rds=1/gds
            plt.semilogy(I_D, rds, label=f'U_GB={u_GS_filter}')
        ax.set_xlabel('I_D')  # Add an x-label to the axes.
        ax.set_ylabel('1/gds')  # Add a y-label to the axes.
        ax.set_title("Lenght={:.2f}".format(r['param']['L']))  # Add a title to the axes.
        ax.legend()  # Add a legend.
        file=os.path.join(workingDir, "gds vs ID, Lenght={:.2f}.png".format(r['param']['L']))
        plt.savefig(file)
        plt.close(fig)

        # Third plot: For a given transistor length plot the intrinsic amplification as a function of the Gate voltage.
        fig, ax = plt.subplots() 
        for u_GS_filter in u_GS_unique: 
            myfilter = df['V_GB'].values == u_GS_filter   
            I_D=df['I_D'].values[myfilter] 
            gds=df['gds'].values[myfilter]
            gm=df['gm'].values[myfilter]    
            gain=gm/gds
            plt.plot(I_D, gain, label=f'U_GB={u_GS_filter}')
        ax.set_xlabel('I_D')  # Add an x-label to the axes.
        ax.set_ylabel('gm/gds')  # Add a y-label to the axes.
        ax.set_title("Lenght={:.2f}".format(r['param']['L']))  # Add a title to the axes.
        ax.legend()  # Add a legend.
        file=os.path.join(workingDir, "gain vs ID, Lenght={:.2f}.png".format(r['param']['L']))
        plt.savefig(file)
        plt.close(fig)
    
        # Fourth plot: For a given transistor length plot gm as a function of the Drain Source voltage. The gate voltage.
        fig, ax = plt.subplots() 
        for u_GS_filter in u_GS_unique: 
            myfilter = df['V_GB'].values == u_GS_filter   
            V_DS=df['V_DS'].values[myfilter] 
            gds=df['gds'].values[myfilter]
            gm=df['gm'].values[myfilter]    
            gain=gm/gds
            ax.plot(V_DS, gm, label=f'U_GB={u_GS_filter}')
        ax.set_xlabel('V_DS')  # Add an x-label to the axes.
        ax.set_ylabel('gm')  # Add a y-label to the axes.
        ax.set_title("Lenght={:.2f}".format(r['param']['L']))  # Add a title to the axes.
        ax.legend()  # Add a legend.
        file=os.path.join(workingDir, "gm vs UDS, Lenght={:.2f}.png".format(r['param']['L']))
        plt.savefig(file)
        plt.close(fig)
    
        # Fifth plot: For a given transistor length plot gds as a function of the Drain Source voltage. The gate voltage.
        fig, ax = plt.subplots() 
        for u_GS_filter in u_GS_unique: 
            myfilter = df['V_GB'].values == u_GS_filter   
            V_DS=df['V_DS'].values[myfilter] 
            gds=df['gds'].values[myfilter]
            gm=df['gm'].values[myfilter]    
            gain=gm/gds
            plt.semilogy(V_DS, gds, label=f'U_GB={u_GS_filter}')
        ax.set_xlabel('V_DS')  # Add an x-label to the axes.
        ax.set_ylabel('gds')  # Add a y-label to the axes.
        ax.set_title("Lenght={:.2f}".format(r['param']['L']))  # Add a title to the axes.
        ax.legend()  # Add a legend.
        file=os.path.join(workingDir, "gds vs UDS, Lenght={:.2f}.png".format(r['param']['L']))
        plt.savefig(file)
        plt.close(fig)
    
        # Sixth plot: For a given transistor length plot the intrinsic gain as a function of the Drain Source voltage. The gate voltage.
        fig, ax = plt.subplots() 
        for u_GS_filter in u_GS_unique: 
            myfilter = df['V_GB'].values == u_GS_filter   
            V_DS=df['V_DS'].values[myfilter] 
            gds=df['gds'].values[myfilter]
            gm=df['gm'].values[myfilter]    
            gain=gm/gds
            plt.semilogy(V_DS, gain, label=f'U_GB={u_GS_filter}')
        ax.set_xlabel('V_DS')  # Add an x-label to the axes.
        ax.set_ylabel('gm/gds')  # Add a y-label to the axes.
        ax.set_title("Lenght={:.2f}".format(r['param']['L']))  # Add a title to the axes.
        ax.legend()  # Add a legend.
        file=os.path.join(workingDir, "gain, Lenght={:.2f}.png".format(r['param']['L']))
        plt.savefig(file)
        plt.close(fig)
