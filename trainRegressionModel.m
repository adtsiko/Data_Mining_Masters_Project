function [SVMreturn] = trainRegressionModel(trainX,trainY,i)
%% Fit regression to the SVM, using training data
if i==2
SVM_model =  fitrsvm(trainX,trainY,'Standardize',true,'KernelFunction','gaussian')
%% Compact if you want to save model
% SVM_model = compact(SVM_model);
save SVM_model
end
load SVM_model
load Data\testSet
%% Predict load using test predictors
SVMreturn = predict(SVM_model, testX);
