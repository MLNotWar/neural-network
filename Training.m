function nn = Training(config)

% Load configuration
load(config);

% Load data
load(params.dataSrc);

% training inputs and targets
train_x = double(datasetInputs{1,1});
train_y = double(datasetTargets{1,1});

% validation inputs and targets
val_x = double(datasetInputs{1,2});
val_y = double(datasetTargets{1,2});

% test inputs and targets
test_x  = double(datasetInputs{1,3});
test_y  = double(datasetTargets{1,3});

% parameters used for visualisation of first layer weights
visParams.noExamplesPerSubplot = 50; % number of images to show per row
visParams.noSubplots = floor(params.hiddenLayers(1) / visParams.noExamplesPerSubplot);
visParams.col = 30;% number of image columns
visParams.row = 30;% number of image rows

% normalise data
inputActivationFunction = 'linear'; 
train_x = normaliseData(inputActivationFunction, train_x, []);
val_x = normaliseData(inputActivationFunction, val_x, []);
test_x = normaliseData(inputActivationFunction, test_x, []);

%initialise NN params
nn = paramsNNinit(params.hiddenLayers, params.hiddenActivationFunctions);
nn = paramsNNRefine(nn, params);

% initialise weights
[W, biases] = initWeights(size(train_x,2), nn.weightInitParams, params.hiddenLayers, params.hiddenActivationFunctions);
nn.W = W;
nn.biases = biases;

[nn, Lbatch, L_train, L_val, clsfError_train, clsfError_val]  = trainNN(nn, train_x, train_y, val_x, val_y);
 
nn = prepareNet4Testing(nn);

% visualise weights of first layer
figure()
visualiseHiddenLayerWeights(nn.W{1},visParams.col,visParams.row,visParams.noSubplots);

[stats, output, e, L] = evaluateNNperformance( nn, test_x, test_y);

% Saves output
if params.saveResult == 1;
   saveResult(params, nn);
end 
end
