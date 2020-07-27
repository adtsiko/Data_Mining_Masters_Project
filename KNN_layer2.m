function [KNNMAE KNNRMSE] = KNN_layer2(trainX,trainY,i)
if i==2
KNN_layer = fitcknn(trainX,trainY,'NumNeighbors',5,'Standardize',1)
KNN_layer = compact(KNN_layer)
save KNN_layer
end
load Data\testSet_layer2
load KNN_layer
%% Predict load using test predictors
predictedLoad = predict(KNN_layer, testX);

err = testY-predictedLoad;
%% Mean absolute Avearage Error/percent
KNNMAE  = mean(abs(err));
KNNRMSE = sqrt(mean(power(abs(err),2)))
end

