function [KNNreturn] = KNN_layer1(trainX,trainY,i)
if i==2
KNN_model = fitcknn(trainX,trainY,'NumNeighbors',5,'Standardize',1)
KNN_model = compact(KNN_model)
save KNN_model
end
load Data\testSet
load KNN_model
%% Predict load using test predictors
KNNreturn = predict(KNN_model, testX);
end

