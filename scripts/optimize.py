def optimize():
    
    file_in='/home/simon/code/asic/analog/tia2/shahdoost_optim1.spice'
    workingDir='/home/simon/code/asic/analog/tia2/shahdoost_optim1'
    cacheDir='/home/simon/optimCache'
    if not os.path.exists(workingDir):
        os.mkdir(workingDir)
    if not os.path.exists(cacheDir):
        os.mkdir(cacheDir)
    
    ngSpice=NgSpice(file_in, workingDir, parallel=True)
    spiceReplace={'vdd#branch':'supply_current'}
    ngOpimizer=NgOptimizer(ngSpice, spiceReplace, cacheDir)
    #fixedParam={'V_SUPPLY': 1.8, 'M1_L': 2, 'M2_L': 0.3, 'M3_L': 0.3}
    fixedParam={'V_SUPPLY': 1.8} #, 'M1_L': 2, 'M2_L': 0.3, 'M3_L': 0.3}
    # optimize={
    #            'M1_W':[2, 1, 25],\
    #           'M2_W':[2, 1, 25],\
    #           'M3_W':[2, 1, 25],\
    #           'V_BIAS1': [0.8, 0.5, 1.8],\
    #           'V_BIAS2': [1, 0.5, 1.8],\
    #           'R3_L': [10, 5, 100],\
    #           }
    #
    optimize={
               'M1_W':[2, 1, 25],\
              'M2_W':[2, 1, 25],\
              'M3_W':[2, 1, 25],\
               'M1_L':[2, 0.15, 6],\
              'M2_L':[0.3, 0.15, 3],\
              'M3_L':[0.3, 0.15, 3],\
              'V_BIAS1': [0.8, 0, 1.2],\
              'V_BIAS2': [1, 0.6, 1.8],\
              'R3_L': [10, 5, 100],\
              }
    
    
    ngOpimizer.setFixedParam(fixedParam)
    ngOpimizer.setOptimizerParam(optimize)
    # Define the cost functions.
    ngOpimizer.setCost({'bw': "lambda x: 0 if x > 1E9 else math.log(abs(x-1E9), 10)*100",\
                        'dc_gain': "lambda x: 0 if x > 45 else abs((x-45)*100)",\
                        'supply_current': "lambda x: 0 if abs(x) < 1E-2 else (abs(x)-1E-2)*100",\
                        })
    ngOpimizer.optimize()




def optimize2():
    
    file_in='/home/simon/code/asic/analog/tia/tia_lownoise2_optim.spice'
    workingDir='/home/simon/code/asic/analog/tia/optim'
    cacheDir='/home/simon/optimCache'
    if not os.path.exists(workingDir):
        os.mkdir(workingDir)
    if not os.path.exists(cacheDir):
        os.mkdir(cacheDir)
    
    ngSpice=NgSpice(file_in, workingDir, parallel=True)
    spiceReplace={'vdd#branch':'supply_current'}
    ngOpimizer=NgOptimizer(ngSpice, spiceReplace, cacheDir)
    #fixedParam={'V_SUPPLY': 1.8, 'M1_L': 2, 'M2_L': 0.3, 'M3_L': 0.3}
    fixedParam={}#'V_SUPPLY': 1.8} #, 'M1_L': 2, 'M2_L': 0.3, 'M3_L': 0.3}
    # optimize={
    #            'M1_W':[2, 1, 25],\
    #           'M2_W':[2, 1, 25],\
    #           'M3_W':[2, 1, 25],\
    #           'V_BIAS1': [0.8, 0.5, 1.8],\
    #           'V_BIAS2': [1, 0.5, 1.8],\
    #           'R3_L': [10, 5, 100],\
    #           }
    #
    optimize={
               'M8':[2, 0.3, 3],\
              'M7':[2, 0.3, 3],\
              'M5':[2, 0.3, 3],\
               'I3':[50, 30, 100],\
              'M15':[0.5, 0.3, 3],\
              'R1':[0.5, 1, 6]
              }
    
    
    ngOpimizer.setFixedParam(fixedParam)
    ngOpimizer.setOptimizerParam(optimize)
    # Define the cost functions.
    #gain max_gain min_gain edge_freq
    #inoise_total onoise_total
    # 'max_gain': "lambda x: 0 if x > 45 else abs((x-45)*100)",\
    # 'min_gain': "lambda x: 0 if abs(x) < 1E-2 else (abs(x)-1E-2)*100",\
                         
    ngOpimizer.setCost({'gain': "lambda x: 0 if x > 50 else (50-x)*1000",\
                        'edge_freq': "lambda x: 0 if x > 1E9 else math.log(abs(x-1E9), 10)*100",\
                        'inoise_total': "lambda x: 0 if x < 1.6E-7 else (x-1.6E-7)*1E7",\
                        })
    ngOpimizer.optimize()
