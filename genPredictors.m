function [tableout,X] = genPredictors(tableout,y,x_feature)
%% Convert Dates into a Numeric Representation 
try
    dates = datenum(tableout.Date);
catch 
    dates = Datenum(tableout.Date, 'yyyy-mm-dd HH:MM:SS') + (tableout.Time-1)/48;
end
%% create at a row datenum in tableout
tableout.datenum = dates;
%% Date predictors
tableout.dayOfWeek = weekday(dates);
%% Predictors
    lag = 1;lead= 10;
    %% Vector Variables
    standardE(1:9)=NaN; mmeanE(1:9)=NaN; K_kurtosisE(1:9)=NaN;S_skewE(1:9)=NaN;
    standardG(1:9)=NaN; mmeanG(1:9)=NaN; K_kurtosisG(1:9)=NaN;S_skewG(1:9)=NaN;
    while lead<=y
     %% Electricity Feature Vector
     % Standard deviation
        standardE(lead) = std(tableout.B1E(lag:lead));
     % Mean
        mmeanE(lead) = mean(tableout.B1E(lag:lead));
     % Kurtosis
        K_kurtosisE(lead) = kurtosis(tableout.B1E(lag:lead));
     % Skewness
        S_skewE(lead) = skewness(tableout.B1E(lag:lead));
     %% Gas Feature Vector
     % Standard deviation
        standardG(lead) = std(tableout.B1G(lag:lead));
     % Mean
        mmeanG(lead) = mean(tableout.B1G(lag:lead));
     % Kurtosis
        K_kurtosisG(lead) = kurtosis(tableout.B1G(lag:lead));
     % Skewness
        S_skewG(lead) = skewness(tableout.B1G(lag:lead));
     % Accumulator
        lag=lag+1;
        lead=lead+1
     
    end
    if (1 == strcmp('A',x_feature))
         X  = [standardE.' standardG.' mmeanE.' mmeanG.' K_kurtosisE.' S_skewE.'...
       tableout.Time tableout.dayOfWeek tableout.B2E tableout.B2G...
       tableout.B3E tableout.B3G tableout.B4E tableout.B4G tableout.B5E tableout.B5G];
    elseif (1 == strcmp('E',x_feature))
         X  = [standardE.' mmeanE.' K_kurtosisE.' S_skewE.'...
       tableout.Time tableout.dayOfWeek tableout.B2E...
       tableout.B3E tableout.B4E tableout.B5E];
    elseif (1 == strcmp('EG',x_feature))
         X  = [standardE.' standardG.' mmeanE.' mmeanG.' K_kurtosisE.' S_skewE.'...
             tableout.B2E tableout.B2G...
       tableout.B3E tableout.B3G tableout.B4E tableout.B4G tableout.B5E tableout.B5G];
   elseif (1 == strcmp('EA',x_feature))
         X  = [standardE.' mmeanE.' K_kurtosisE.' S_skewE.'...
             tableout.B2E ...
       tableout.B3E tableout.B4E tableout.B5E];
    end

end

