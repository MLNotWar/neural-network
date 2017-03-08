function nn = paramsNNRefine( nn, params )

nn.epochs = params.epochs;

nn.trParams.lrParams.initialLR = params.lrInitValue;
nn.trParams.lrParams.lrEpochThres = params.lrEpochThres;
nn.trParams.lrParams.schedulingType = params.lrUpdate;

nn.trParams.momParams.schedulingType = params.momScheduling;
nn.trParams.momParams.momentumEpochLowerThres = params.momEpochLowThres;
nn.trParams.momParams.momentumEpochUpperThres = params.momEpochUppThres;

nn.dropoutParams.dropoutType = params.dropout;

nn.weightConstraints.weightPenaltyL1 = params.L1Penalty;
nn.weightConstraints.weightPenaltyL2 = params.L2Penalty;
nn.weightConstraints.maxNormConstraint = params.maxNormConstraint;

nn.diagnostics = params.diagnostics;
nn.showDiagnostics = params.diagnosticsFreq;

nn.showPlot = params.showPlot;
nn.savePlot = params.savePlot;
nn.outputFile = params.outputFile;
nn.type = params.type;

nn.weightInitParams.type = params.weightInit;
nn.trainingMethod = params.trainingMethod;
end

