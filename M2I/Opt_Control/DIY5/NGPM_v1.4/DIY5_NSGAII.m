% Programa principal que resuelve el problema de minimización 
%   propuesto en el DIY5

clear; close all

options = nsgaopt(); % create default options structure
options.popsize = 50; % population size
options.maxGen = 200; % max generation
options.numObj = 2; % number of objectives
options.numVar = 2; % number of design variables
options.numCons = 0; % number of constraints
options.lb = [0 0]; % lower bound of x
options.ub = [5 5]; % upper bound of x
options.objfun = @DIY5_objfun; % objective function handle
result = nsga2(options); % start the optimization progress