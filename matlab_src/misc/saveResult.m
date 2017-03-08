function nn = saveResult( params, nn )
    file = fopen([params.outputFile '.log'],'w');
    fprintf(file, 'Neural Network \n');
    
    fprintf(file, 'Basic Information:\n');
    fprintf(file, 'Type: Clssifier\n');
    fprintf(file, 'Training Method: SGD with Momentum\n');
    fprintf(file, 'Epochs: %i\n', params.epochs);
    fprintf(file, 'Batch Size: 100\n');
    fprintf(file, 'Weight Init: 8\n');
    fprintf(file, '\n');
    
    fprintf(file, 'Network Topography:\n');
    fprintf(file, 'Hidden Layers: [');
    fprintf(file, ' %i ', params.hiddenLayers(:));
    fprintf(file, ']\n');
    fprintf(file, 'Activation Functions: {');
    fprintf(file, ' %s ', params.hiddenActivationFunctions{:});
    fprintf(file, '}\n');
    fprintf(file, '\n');
    
    fprintf(file, 'Learning:\n');
    fprintf(file, 'Learning Rate: %0.3f\n', params.lrInitValue);
    fprintf(file, '\n');
    
    fprintf(file, 'Regularisation:\n');
    fprintf(file, 'Dropout: %i\n', params.dropout);
    fprintf(file, '\n');
    
    fprintf(file, 'Results\n');
    disp( nn.classErrorOnTraining);
    fprintf(file, 'Classfication Error on Training Set: %s\n', nn.classErrorOnTraining);
    fprintf(file, 'Classfication Error on Validation Set: %s\n', nn.classErrorOnValidation);
    
    fclose(file);
end

