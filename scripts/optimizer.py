from scipy.optimize import least_squares, differential_evolution
import multiprocessing
import pandas as pd
from matplotlib.mlab import angle_spectrum
import numpy as np
import inspect
import gc 
import time
from multiprocessing import reduction
import math
import os
import hashlib
import pickle

class NgOptimizer():
    '''
    Implements a circuit optimizer
    
    '''
    def __init__(self, ngSpiceInstance, spiceReplace, cacheDir):
        '''
        
        :param ngSpiceInstance:
        :param spiceReplace:
        
        '''
        self.fixedParam={}
        self.optimizeParam={}
        self.spiceReplace=spiceReplace
        self.method='diffevol'
        self.ngSpiceInstance=ngSpiceInstance
        if self.method=='diffevol':
            self.ngSpiceInstance.parallel=False
        self.cacheDir=cacheDir
        
    
    def setFixedParam(self, param, keepOld=False):
        '''
        
        '''
        if not keepOld: self.fixedParam={}
            
        for k, v in param.items():
            self.fixedParam[k] = v
        
    def setOptimizerParam(self, optimizeParam, keepOld=False):
        '''
        
        :param initialGuess: {value: [ignored, min, max] }
        :tpye initialGuess: dict
        '''
        #key: value: list; [0]: ignored [1]: min [2]: max
        if not keepOld: self.optimizeParam={}
            
        for k, v in optimizeParam.items():
            self.optimizeParam[k] = v
        
        

    def setCost(self, cost):
        '''
        '''
        self.cost=cost
        
        
    def optimize(self):
        '''
        
        '''
        self.ngSpiceInstance.setConstants(self.fixedParam, keepOld=False)
        self.spiceFileHash=self.ngSpiceInstance.getFileHash()
        self.cacheDir=os.path.join(self.cacheDir, self.spiceFileHash)

        if not os.path.exists(self.cacheDir):
                os.mkdir(self.cacheDir)
            
        # We need a defined sequence of parameters
        self.parSequence=list(self.optimizeParam.keys())
        self.costSequence=list(self.cost.keys())
        # Generate a list out of the initial guess dictionary.
        initialGuess=[self.optimizeParam[k][0] for k in self.parSequence]    
        # Generate a dummy result
     
        # TODO: Perform a test run with spice using the initial guess to verify we get results for all parameters needed for cost calculation. 
     
     
        # Get boudaries for parameter space 
        bounds=[(self.optimizeParam[k][1],self.optimizeParam[k][2]) for k in self.parSequence]
        if self.method == 'diffevol':
            self.firstRun=True
            default=9e10
#            bestResult=differential_evolution(differentialEvolutionFunc, bounds, args=(default), maxiter=1)#, workers=-1)#, bounds, args=default, )
            
            bestResult=differential_evolution(self._deFunc, bounds, workers=-1, mutation=(0.1,1.5), seed=1)#, )#, bounds, args=default, )
            print(bestResult)
            resultDict={k:v for k,v in zip(self.parSequence, bestResult['x'])}
            print('Optimization result: ', resultDict)
     
        elif self.method == 'leastsq':
            default=[9e10 for k in self.cost.keys()]
            
            # Iterate
            for iter in range(10): 
                simulationResult={}
                for iteration in range(20): 
                    maxfev=(iteration+1)*multiprocessing.cpu_count()*2
                
                    print("maxfev: ", maxfev)
                    bestResult=least_squares(leastsqFunc, initialGuess,  args=(simulationResult, default), max_nfev=maxfev, method='dogbox')
                    print('Iteration: ', iteration)
                    print("Best result: ", bestResult['x'])
                    print("Cost: ", bestResult['fun'])
                    spiceResult=self._runSpiceMulti(simulationResult)
                    simulationResult=self._calcCost(simulationResult, spiceResult)
                    #print(simulationResult)
                    
                initialGuess=bestResult['x']
                gc.collect()        
                
        #elif self.method == 'leastsq'
        
        
    def _deFunc(self, param):
        '''
        
        '''
        
        # We use a cache to speed up multiple runs.
        paramHash=hashlib.sha1(param.tobytes()).hexdigest()
        
        cacheFile=os.path.join(self.cacheDir, paramHash)
        
        
        if os.path.exists(cacheFile):
            # If we have a cache hit simply load the result from the file.
            with open(cacheFile, 'rb') as file: 
                result, cost=pickle.load(file)
        else:    
            spiceResult=self._runSpiceSingle(param)
            result=self._spiceResultToDict(spiceResult, True)
            if len(result) != 1:
                raise(RuntimeError(f'This is a bug. Expected 1 simulation result. Got {len(result)}'))
            cost=self._calcCostSingle(result[0])
            with open(cacheFile, 'wb') as file: 
                pickle.dump((result, cost), file)
        sumCost=np.sum(cost)
        print('\nResult: ', result[0], ' Cost: ', cost, ' Sum Cost: ', sumCost)
        return sumCost

    def _runSpiceSingle(self, param):
        forSpice=[]
        # Generate a dataframe we can provide to out NgSpice class as input.
        # Combine the parameter names from parSequence with the values requested by least_squares.
        forSpice.append({k:p for k,p in zip(self.parSequence, param)})
        # Transform the dict to a dataframe
        df=pd.DataFrame.from_dict(forSpice)
        # Run Ngspice
        spiceResult=self.ngSpiceInstance.run(df, delete=True, rename=self.spiceReplace)
        
        return spiceResult

    def _runSpiceMulti(self, simulationResult):
        '''
        Run the spice simulation
        '''
        
        forSpice=[]
        # Generate a dataframe we can provide to out NgSpice class as input.
        for par, simResult in simulationResult.items():
            # If for given parameters we don't have a simulation result create an input for Spice
            if simResult[1] is None:
                # Combine the parameter names from parSequence with the values requested by least_squares.
                forSpice.append({k:p for k,p in zip(self.parSequence, simResult[0])})

        # Transform the dict to a dataframe
        df=pd.DataFrame.from_dict(forSpice)
        
        # Run Ngspice
        spiceResult=self.ngSpiceInstance.run(df, delete=True, rename=self.spiceReplace)
        return spiceResult

    def _spiceResultToDict(self, spiceResult, ignoreMissingResult):     
        '''
        Converts the results of a series of spice simulations to dictionaries.
        
        :param spiceResult: Result of :py:meth:ǸgSpice.run.
        
        :returns: A list of dictionaries: The key in the dictionary is part of self.costSequence. The value corresponds to the output of spice.
        '''   
        # Our simulation result should match our cost functions.
        # Flatten the result and convert the pandas data frames to a dictionary.
        # The column names of interest are the key of the initial guess. 
        columnNames=self.cost.keys()
        
        result=[]
        
        for spiceR in spiceResult:
            
            resultDict={}
            # Fill the dictionary. 
            for column in columnNames:
                for res in spiceR['results']:
                    if column in res.columns:
                        # Only consider unique results.
                        resultDict[column] = res[column].unique()
                        
            # Do sanity checks.
            for column in columnNames:
                
                # First of all we want a result for each parameter for which a cost was defined.
                if not column in resultDict:
                    # Handle the situation in which we don't have a result.
                    if  ignoreMissingResult:
                        resultDict[column] = np.NaN
                    else: 
                        raise(RuntimeError(f'No spice simulation result for item {column}'))
                self.firstRun=False
                # Try to convert numpy arrays to float.
                if type(resultDict[column]) == np.ndarray:
                    if len(resultDict[column]) == 1:
                        resultDict[column]=resultDict[column][0]
                # If the have a result it has to be unique.
                datatype= type(resultDict[column])
                if not datatype == float and not datatype == np.float64:
                    raise(RuntimeError(f"Got data type {datatype}. I'm interpreting this as non-unique simulation result"))
            # Add the dictionary to the result
            result.append(resultDict)
            
        return result

    def _calcCost(self, simulationResult, spiceResult):
        
        # Fill simulationResult with the results of the simulation.
        for par, simResult in simulationResult.items():
            # We only need to add a result if none is there.
            if simResult[1] is None:
                # Reconstruct the spice input parameters
                forSpice={k:p for k,p in zip(self.parSequence, simResult[0])}
                # Search the simulation result for the given simulation set of input parameters.
                for s in spiceResult:
                    if forSpice == s['param']:
                        # Apply cost funtion
                        #result=s['results']
                        resultDict=self._spiceResultToDict(s, True)

                        costResult=self._calcCostSingle(resultDict)
                          
                        simulationResult[par] = (simResult[0], costResult)
            # Do some sanity checks. E.g. if we don't have a result, we should fail.
            if simulationResult[par][1] is None:
                raise(RuntimeError('Failed to find simulation results for a given set of parameters. This is a Bug.'))
        return simulationResult

    def _calcCostSingle(self, result):
        '''
        Apply the cost function to a single simulation result.
        '''
        costResult=[]

        for costName in self.costSequence:
            # Get the numeric result
            resultValue=result[costName]
            # Get the cost function
            costFunction=eval(self.cost[costName])
            # Apply the const function
            # If we have a NaN reutrn a very large cost
            if np.isnan(resultValue):
                costResult=[1E9 for x in self.costSequence]
                #if sumCost:
                return  costResult
            else:
                try:
                    cost=costFunction(resultValue)
                except:
                    print("Cost calculation failed.")
                    print(f"Spice simulation result: {resultValue}")
                    print(f"Cost name: {costName}")
                    print(f"Cost function: ", inspect.getsource(costFunction))
                    raise
            costResult.append(cost)
        # Write the result of the cost calculation to the simulation result.
#        if sumCost:
 #           costResult=np.sum(costResult)
            
        return costResult

def differentialEvolutionFunc(a, b):
    '''
    
    '''
    print("Function call")


def leastsqFunc(param, result, default):
    '''
    Funtion for least_squares. We don't run spice in here. Instead we collect input for spice and return know spice parameters.
    '''
    
    hash=str(param)
    
    if hash in result:
        res= result[hash][1]
    else:
        result[hash] = (param, None)
        res=default
    print(param,res)
    if res is None:
        res = default
    return res 
    
