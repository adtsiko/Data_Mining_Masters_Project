function  [Layer2_input, actual,i,Backup_]=algorithm(s,y,i, Layer2_input,Backup_, actual,x_feature,N,llayer)
[tableout,X] = Auto_Load(s,y,x_feature,N);
%% Seperate Training Data and Test Data
threshold = ((length(tableout.datenum)-48));
%Creating Training data to mimic test data
if i == 2
    z=0;b=2;x=0;k=1;
    length_k=length(tableout.B1E)
    while k<=length_k
          if x >= ((N-1)*48)
             trainInd(k) = 0;
             testInd(k) = 1;
             z=z+1;
             if z == 48
                 x=0;
                 b=2
                 z=0;
             end
          else
              trainInd(k) = 1;
              testInd(k) = 0;
          end
          k=k+1
          x=x+1;
    end
     trainInd = logical(trainInd)
     testInd = logical(testInd)
else
        trainInd = transpose(tableout.datenum < tableout.datenum(threshold));
        testInd =  transpose(tableout.datenum >= tableout.datenum(threshold));
end
trainX = X(trainInd,:);
trainY =  tableout.B1E(trainInd);
%% Layer 1 Feature Vector
[layer1_output,testY] = Layer1_feature_vector(X,tableout,testInd,trainX,trainY,i)
layer1_output=abs(layer1_output);
actual = vertcat(actual,testY)
Layer2_input=vertcat(Layer2_input,layer1_output);
%% Layer 2 Feature Vector
threshold_2 = length(Layer2_input)
%% Seperating test data and training data
if threshold_2 >=20
    j=1
    length_input = length(Layer2_input)
    length_delayed = length_input -19
    while j<=length_delayed
    trainInd_2(j) = 1;
    testInd_2(j) = 0;
    j=j+1;
    end
    while j<=length_input 
    trainInd_2(j) = 0;
    testInd_2(j) = 1;
    j=j+1;
    end
    trainInd_2 = logical(trainInd_2)
    testInd_2 = logical(testInd_2)
    trainX_2 = Layer2_input(trainInd_2,:);
    trainY_2 =  actual(trainInd_2);
    [SVMMAE,SVMRMSE] = Layer2_feature_vector(Layer2_input,actual, testInd_2, trainX_2,trainY_2,i,llayer);
 %% Write MAE
     results = round([SVMMAE,SVMRMSE],2);
    Backup_=vertcat(Backup_,results );
end
 end

     
