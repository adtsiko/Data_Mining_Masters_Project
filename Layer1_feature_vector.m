function [layer1_output, testY] = Layer1_feature_vector(X,tableout,testInd,trainX,trainY,i)
%% Create test data and save on an external memory for SVM and DT use
testX = X(testInd,:);
testY = tableout.B1E(testInd);
testDates = tableout.datenum(testInd);
save Data\testSet testDates testX testY
% %% Neural Network
 [NNreturn] = myNeuralNetworkFunction(trainX,trainY,i);
%% Decision Trees
 [DTreturn] = t_trainRegressionModel(trainX, trainY,i);
%% Regression 
 [SVMreturn] = trainRegressionModel(trainX, trainY,i);
 %% KNN 
 [KNNreturn] = KNN_layer1(trainX,trainY,i)
 %% GPR
 [GPRreturn] = GPR_layer1(trainX,trainY,i)
 %% Output 
 layer1_output = [NNreturn DTreturn SVMreturn KNNreturn GPRreturn]
end

