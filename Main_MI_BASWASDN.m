%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 3-layer feed-forward neuronet model, trained by a BASWASD      %
%  algorithm. (version 1.0)                                         %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: T.E. Simos, V.N.Katsikis, S.D.Mourtas     %
%                                                                   %
%   e-Mail: tsimos.conf@gmail.com                                   %
%           vaskatsikis@econ.uoa.gr                                 %
%           spirosmourtas@gmail.com                                 %
%                                                                   %
%   Main paper: T.E. Simos, S.D.Mourtas, V.N.Katsikis,              %
%               "Multi-Input Beetle Antennae Search Weights and     %
%               Structure Determinantion Neuronet with Applications %
%               in European Central Bank Publications",(submitted)  %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose modeling problem (for x = 1 to 4)
x=1;
[X_train,Y_train,X_test,Y_test,p,d,delta]=problem(x);
[H,M]=size(X_train);
n=10;    % number of hidden units
tmax=40; % number of training iterations

%% Training
% Data Preprocessing - Normalization
[z_N,z_min,z_max]=Normalization(X_train); 
[y_N,y_min,y_max]=Normalization(Y_train);

% Neuronet model
tic
[W,N,Em,E]=BASWASD(z_N,y_N,H,M,n,tmax,p,d,delta);  % optimal hidden-layer structure
toc

%% Predict
pred=predictN(X_test,W,N,z_min,z_max,y_min,y_max); % forecasting for the next Z data

Et=error_pred(pred,Y_test); % Error of test data

%% Figures
[k,ind]=sort(Y_test);

figure
plot(1:length(Y_test),pred(ind),'Color',[0.4940 0.1840 0.5560])
hold on
plot(1:length(Y_test),k,'--','Color',[0.4660 0.6740 0.1880])
xlabel('Test Data Samples');ylabel('Price')
legend('Predicted price','Actual price')
hold off

figure
semilogy(0:length(E)-1,E,'Color',[0.4940 0.1840 0.5560])
hold on
semilogy(find(E==Em)-1,Em,'.','Color',[0.4660 0.6740 0.1880],'MarkerSize',16)
xlabel('Iteration');ylabel('MAPE %')
legend('$E_N$','$E_{N^*}$','Interpreter','latex')
hold off
