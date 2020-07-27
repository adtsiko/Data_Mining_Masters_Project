function  [NNreturn] = myNeuralNetworkFunction(trainX,trainY,i)
%% Electricity Load Forecasting using Neural Networks 
% Initialize and Train Network
if i ==2
NN_model = newfit(trainX', trainY', [10 10 10]);
NN_model.performFcn = 'mae';
NN_model = train(NN_model, trainX', trainY')
save NN_model
end
%% Predict using Neural Network Model
load NN_model
load Data\testSet
NNreturn = sim(NN_model, testX')';

