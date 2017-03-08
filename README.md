# Neural Network
## Getting Started
The Neural Network Algorithm is built with Matlab and relies on a Deep Learning Toolbox created by Stavros Petridis.

> Note: Download data from [this link](https://ibug.doc.ic.ac.uk/media/uploads/documents/courses/data4students.mat)

## Installing Matlab
Download the latest version of Matlab from [their website](http://uk.mathworks.com/help/install/ug/install-mathworks-software.html?requestedDomain=uk.mathworks.com) and follow the installation instructions.

## Running the Neural Network Trainer
### Adding the paths
In order to use Matlab you need to add the path to all the files by using the following command:
```
matlab -nodesktop -nosplash -r "addpath('path_to_directory/neural-network/NN', 'path_to_directory/neural-network/DBN','path_to_directory/neural-network/misc', 'path_to_directory/neural-network/examples','path_to_directory/neural-network');"
```

### Creating your configuration
Edit the hyper-parameters to your liking in Configurer.m then run the following command in order to generate a .mat configuration file:
```
matlab -r 'Configurer'
```

### Building the neural network
Now that you have defined your network configuration simply run the following command to build the neural network:
```
matlab -r 'Training('<config.mat>')'
```
