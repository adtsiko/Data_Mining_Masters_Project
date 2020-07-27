function [SVMMAE,SVMRMSE] = SVM_layer2(trainX,trainY,i)
if i ==2
%% Fit regression to the SVM, using training data
SVM_layer2 = fitrsvm(trainX,trainY)
%% Compact if you want to save model
save SVM_layer2
end
load SVM_layer2
load Data\testSet_layer2
%% Predict load using test predictors
predictedLoad = predict(SVM_layer2, testX);
%% Compare Forecast Load and Actual Load
% Error 
err = testY-predictedLoad;
%% Mean absolute Avearage Error/percent
SVMMAE  = mean(abs(err));
SVMRMSE = sqrt(mean(power(abs(err),2)))


