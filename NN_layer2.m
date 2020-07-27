function  [NNMAE,NNRMSE] = NN_layer2(trainX,trainY,i)
%% Electricity Load Forecasting using Neural Networks 
%% Initialize and Train Network
if i ==2
NN2_layer = newfit(trainX', trainY', [10 10 10]);
NN2_layer.performFcn = 'mae';
NN2_layer = train(NN2_layer, trainX', trainY')
save NN2_layer
end
load NN2_layer
%% Predict using Neural Network Model
load Data\testSet_layer2
predictedLoad = sim(NN2_layer, testX')';
%% Compare Forecast Load and Actual Load
% Error 
err = testY-predictedLoad;
%% Mean absolute Avearage Error/percent
NNMAE  = mean(abs(err));
NNRMSE = sqrt(mean(power(abs(err),2)))
