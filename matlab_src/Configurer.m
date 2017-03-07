configurationName = 'config1';
params.dataSrc = 'data4students.mat';

% Set Up the Network 
load(params.dataSrc);
outputSize = size(double(datasetTargets{1,1}),2); 
num_hidden_layers = 5;
activationFunction = 'leakyReLu';
layerSize = 1000;
widthReg = 'n';
params.hiddenActivationFunctions = {};
params.hiddenLayers = [];
for i = 1:num_hidden_layers
    params.hiddenLayers(1, i) = layerSize;
    params.hiddenActivationFunctions{1,i} = activationFunction;
end
params.hiddenLayers(1, num_hidden_layers+1) = outputSize;
params.hiddenActivationFunctions{1, num_hidden_layers+1} = 'softmax';

% Number of Epochs
params.epochs = 3;

% Learning Rate Parameters
params.lrInitValue = 0.004;
params.lrEpochThres = 10;
params.lrUpdate = 2;

% Momentum Parameters
params.momScheduling = 1;
params.momEpochLowThres = 10;
params.momEpochUppThres = 15;

% Regularisation Parameter
params.dropout = 1;
params.L1Penalty = 0;
params.L2Penalty = 0;
params.maxNormConstraint = 4;

% Diagnostics Parameters
params.diagnostics = 1;
params.diagnosticsFreq = 5;

% Plot Parameters
params.showPlot = 1;
params.savePlot = 1;
[row, sz] = size(hiddenLayers);
params.outputFile = ['plot_e' num2str(params.epochs) '_r' num2str(params.dropout) '_t' num2str(sz) widthReg];


params.type = 2;

% set the type of weight initialisation (check manual for details)
params.weightInit = 8;

% set training method
% 1: SGD, 2: SGD with momentum, 3: SGD with nesterov momentum, 4: Adagrad, 5: Adadelta,
% 6: RMSprop, 7: Adam
params.trainingMethod = 2;


save([configurationName '.mat'], 'params');