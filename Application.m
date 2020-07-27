%% Anesu Tsiko SN: 14157830
%University of Hertfordsire
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input last layer Machine Learner
 llayer = 'SVM';% Generalizing MLA
%% Database File
 s = 'dataset.xlsx';
%% Initialise global variables
%'A'= Group 1 'E'= Group 2 'EG' = Group 3 'EA' = Group 4
 x_feature = 'E' %First feature Extraction 
 i=2;N=2;% N previous value
 Layer2_input=[];actual=[];Backup_=[];llast=[];
%% Main Loop
    while N <= 125
        %% Sets y to 600 as the first iteration is the training set (2 years)
        y= 600
        while y <= 1160
            %% Function Contains all other Functions
            [Layer2_input, actual,i,Backup_]=algorithm(s,y,i, Layer2_input,...
            Backup_, actual,x_feature,N,llayer)
            y = y+N; % adds n-sample to y   
            i=i+1
        end
        %% Save the mean average results of Nth Sample
        x=nanmean(Backup_) ;
        Backup_=[];
        llast = vertcat(llast,x);
        %% Change window size
        if N == 2
            N= 5;
            Layer2_input=[];
        elseif N == 5
            N=10;
            Layer2_input=[];
        elseif N == 10
            N=25;
            Layer2_input=[];
        else
            N=N+25;
            Layer2_input=[];
        end
        %% Changing Feature setup when results for all Nth sample window size are complete
        if N==150
            if (1 == strcmp('E',x_feature))
                x_feature = 'A';
                E_llast= llast;
                save E_llast
                N=2
            elseif(1 == strcmp('A',x_feature))
                x_feature = 'EG';
                A_llast= llast;
                save A_llast
                N=2
            elseif(1 == strcmp('EG',x_feature))
                x_feature = 'EA';
                EG_llast= llast;
                save EG_llast
                N=2
            else
                EA_llast= llast;
                save EA_llast
            end
            llast = [];
        end
        %% Resets i so the ML train for the new window size
        i=2;
    end




