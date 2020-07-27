SVMMAE=0; SVMRMSE = 0;
filename = 'dataset.xlsx';
                sheetname = 'results';
results = round([SVMMAE,SVMRMSE],2);
            xlRange = strcat('E',int2str(i));
             xlswrite(filename,results,sheetname,xlRange)