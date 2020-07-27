function [DTreturn] = t_trainRegressionModel(trainX, trainY,i)
%% Individual trees tend to overfit, using bagged trees combine the results from many decision trees 
%% which reduces over fitting and improves generalisation
if i == 2
DT_model = TreeBagger(24, trainX, trainY, 'method', 'regression', 'minleaf', 24,'OOBPrediction','on') 
%%  Compact if to save model & Predict
DT_model = compact(DT_model);
save DT_model
end
load DT_model
load Data\testSet 
DTreturn = predict(DT_model, testX);
