function [DTMAE,DTRMSE] = DT_layer2(trainX, trainY,i)
%% Individual trees tend to overfit, using bagged trees combine the results from many decision trees 
%% which reduces over fitting and improves generalisation
if i == 2
DT_Layer2 =  TreeBagger(24, trainX, trainY, 'method', 'regression', 'minleaf', 24,'OOBPrediction','on') 
%%  Compact if to save model & Predict
DT_Layer2 = compact(DT_Layer2);
save DT_Layer2
end
load DT_Layer2
load Data\testSet_layer2
predictedLoad = predict(DT_Layer2, testX);
%% Compare Forecast Load and Actual Load
% Error 
err = testY-predictedLoad;
% %% Mean absolute Avearage Error/percent
DTMAE  = mean(abs(err));
DTRMSE = sqrt(mean(power(abs(err),2)))


