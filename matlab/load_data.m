
% Loading data function
function [learnIn, learnOut, testIn, testOut, labellearn, labeltest] = load_data()
 % Specify the file of the dataset (Change the file as the case study)
 file='/home/sd/Documents/Octave/SVR_EO/matlab/Datasets/Coxs_data_example.csv';

 in_cols =[3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]; % Model of input combination data (colomn indexes)

 
 out_cols= [2]; %% The output of the model. 

 data = csvread(file);

 records = size(data,1)-1;
 cols = size(data,2);

 learnRate = 70
 learnCount = round((records*learnRate)/100)
 testCount = records-learnCount;

 %Create data matrices
 labellearn = 1 : learnCount;

 %learnIn = zeros(learnCount, (cols-2));
 learnIn = zeros(learnCount, size(in_cols,2));
 learnOut = 1 : learnCount;

 labellearn = labellearn';
 learnOut = learnOut';

 labeltest = 1 : testCount;
 %testIn = zeros(testCount, (cols-2));
 testIn = zeros(testCount, size(out_cols,2));
 testOut = 1 : testCount;

 labeltest = labeltest';
 testOut = testOut';

 for i = 1 : learnCount

    learnOut(i)=data((i+1), out_cols(1));

    for j = 1 : size(in_cols, 2)
          learnIn(i,j) = data((i+1), in_cols(j));
    end
 end

 for i = 1 : testCount

      testOut(i)=data((i+1+learnCount), out_cols(1));

      for j = 1 : size(in_cols,2)
             testIn(i,j) = data((i+1+learnCount), in_cols(j));
      end
 end

 disp("---- learnIn : "); disp(size(learnIn,1));

 disp("---- learnOut : "); disp(size(learnOut,1));

 disp("---- TestIn : "); disp(size(testIn,1));

 disp("---- TestOut : "); disp(size(testOut,1));

 disp("**** Data is loaded ...");

endfunction
