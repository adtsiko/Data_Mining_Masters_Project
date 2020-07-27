function [KNNMAE KNNRMSE] = GPR_layer2(trainX,trainY,i)
if i==2
GPR_layer2 = fitrgp(trainX,trainY,'KernelFunction','squaredexponential');
GPR_layer2 = compact(GPR_layer2)
save GPR_layer2
end
load GPR_layer2
load Data\testSet_layer2
%% Predict load using test predictors
predictedLoad = predict(GPR_layer2, testX);

err = testY-predictedLoad;
%% Mean absolute Avearage Error/percent
KNNMAE  = mean(abs(err));
KNNRMSE = sqrt(mean(power(abs(err),2)));
end
