function [MAE RMSE] = Layer2_feature_vector(Layer2_input,actual, testInd_2, trainX_2,trainY_2,i,llayer)
%% Create test data and save on an external memory for SVM and DT use
testX = Layer2_input(testInd_2,:);
testY = actual(testInd_2);
 
save Data\testSet_layer2  testX testY
if (1 == strcmp('SVM',llayer))
[MAE RMSE] = SVM_layer2(trainX_2,trainY_2,i)
elseif (1 == strcmp('NN',llayer))
[MAE RMSE] = NN_layer2(trainX_2,trainY_2,i)
elseif (1 == strcmp('DT',llayer))
[MAE RMSE] = DT_layer2(trainX_2,trainY_2,i)
elseif (1 == strcmp('KNN',llayer))
[MAE RMSE] = KNN_layer2(trainX_2,trainY_2,i)
elseif (1 == strcmp('GPR',llayer))
[MAE RMSE] = GPR_layer2(trainX_2,trainY_2,i)
end
end

