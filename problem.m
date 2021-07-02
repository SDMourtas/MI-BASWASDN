function [X_train,Y_train,X_test,Y_test,p,d,delta,n,tmax]=problem(x)
% Input data and parameters of the MI-BASWASDN setup

warning off
if x==1
    filename='Summary balance of payments (BPM6).csv';  % Example 1
    data=readtable(filename,'ReadVariableNames',true,'ReadRowNames' ,true,'TreatAsEmpty' ,'-');
    data=data(4:158,:);
    xx=str2double(data{:,:}); 
    varnames=data.Properties.VariableNames;
    T = array2table(xx,'VariableNames',varnames);
    p=0.65;d=8;delta=5;
    n=10;    % number of hidden units
    tmax=40; % number of training iterations
elseif x==2
    filename='Listed shares issued by euro area residents.csv';  % Example 2
    data=readtable(filename,'ReadVariableNames',true,'ReadRowNames' ,true,'TreatAsEmpty' ,'-');
    data=data(4:362,:);
    xx=str2double(data{:,:}); 
    varnames=data.Properties.VariableNames;
    T = array2table(xx,'VariableNames',varnames);
    p=0.75;d=10;delta=10;
    n=10;    % number of hidden units
    tmax=60; % number of training iterations
elseif x==3
    filename='Trade in goods, Eurostat External Trade Statistics.csv';  % Example 3
    data=readtable(filename,'ReadVariableNames',true,'ReadRowNames' ,true,'TreatAsEmpty' ,'-');
    data=data(5:254,:);
    xx=str2double(data{:,:}); 
    varnames=data.Properties.VariableNames;
    T = array2table(xx,'VariableNames',varnames);
    p=0.7;d=10;delta=10;
    n=10;    % number of hidden units
    tmax=60; % number of training iterations
elseif x==4
    filename='liq_daily_2020.csv';  % Example 4
    data=readtable(filename,'ReadVariableNames',true,'ReadRowNames' ,true,'TreatAsEmpty' ,'-');
    data=data(2:end,1:7);
    xx=str2double(data{:,:}); 
    varnames=data.Properties.VariableNames;
    T = array2table(xx,'VariableNames',varnames);
    p=0.85;d=10;delta=5;
    n=10;    % number of hidden units
    tmax=40; % number of training iterations
else
    fprintf('Error: No valid problem.\n')
    return
end

% training data
col=2:size(T,2);q=1:size(T,1);qq=round(length(q)/2);
if x<4
    train_row=q(end:-1:qq+1); % training-testing: 50-50%
    test_row=q(qq:-1:1);
else
    train_row=q(1:qq);        % training-testing: 50-50%
    test_row=q(qq+1:end);
end
X_train=T{train_row,col}; 
Y_train=T{train_row,1};
X_test=T{test_row,col}; 
Y_test=T{test_row,1};