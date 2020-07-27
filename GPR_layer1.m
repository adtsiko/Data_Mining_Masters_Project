function [GPRreturn] = GPR_layer1(trainX,trainY,i)
if i==2
GPR_model = fitrgp(trainX,trainY,'KernelFunction','squaredexponential');
GPR_model = compact(GPR_model)
save GPR_model
end
load GPR_model
load Data\testSet
%% Predict load using test predictors
GPRreturn = predict(GPR_model, testX);

end

