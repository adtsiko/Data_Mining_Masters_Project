function [tableout, X] = Auto_Load(s,y,x_feature,N)
%% Auto_Load X, dates, labels,tableout
if y <600
    x = 1;
else
x = (y-(N))*48;
end 
y = y*48; 
%% Only loads specified data sheets
if (1 == strcmp('dataset.xlsx',s))
tableout = database(s,'date',x,y);
elseif (1 == strcmp('parliament.xlsx',s))
tableout = parliament(s,'date',1,y);
end
%% Predictors output
y=(y-x)+1;
[tableout,X] = genPredictors(tableout,y,x_feature);
 end

