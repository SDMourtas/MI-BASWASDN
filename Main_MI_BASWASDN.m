%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 3-layer feed-forward neuronet model, trained by a BASWASD      %
%  algorithm. (version 1.0)                                         %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: T.E. Simos, V.N.Katsikis, S.D.Mourtas     %
%                                                                   %
%  e-Mail: tsimos.conf@gmail.com                                    %
%          vaskatsikis@econ.uoa.gr                                  %
%          spirosmourtas@gmail.com                                  %
%                                                                   %
%  Main paper: T.E. Simos, S.D.Mourtas, V.N.Katsikis,               %
%              "Multi-Input Bio-inspired Weights and Structure      %
%              Determination Neuronet with Applications in          %
%              in European Central Bank Publications", Mathematics  %
%              and Computers in Simulation, vol. 193, 451-465 (2021)%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose modeling problem (for x = 1 to 4)
x=1;
% Choose method: BASWASD (y = 1), MIHPN_WASD (y = 2)
%                Linear SVM (y==3), Exp. GPR (y==4)
y=1;

[X_train,Y_train,X_test,Y_test,p,d,delta,n,tmax]=problem(x);
[H,M]=size(X_train);

%% Training
if y==1 || y==2
% Data Preprocessing - Normalization
[z_N,z_min,z_max]=Normalization(X_train); 
[y_N,y_min,y_max]=Normalization(Y_train);

% Neuronet model
if y==1
tic
[W,N,Em,E]=BASWASD(z_N,y_N,H,M,n,tmax,p,d,delta);  % optimal hidden-layer structure
toc
elseif y==2
tic
[W,N,Em,E]=MIHPN_WASD(z_N,y_N,H,M);  % optimal hidden-layer structure
toc
end

%% Predict
predt=predictN(X_train,W,N,z_min,z_max,y_min,y_max,y);
pred=predictN(X_test,W,N,z_min,z_max,y_min,y_max,y);
elseif y==3
tic
trainedModel=LSVM([X_train,Y_train],x);
toc
predt=trainedModel.predictFcn(X_train);
pred=trainedModel.predictFcn(X_test);
elseif y==4
tic
trainedModel=EGPR([X_train,Y_train],x);
toc
predt=trainedModel.predictFcn(X_train);
pred=trainedModel.predictFcn(X_test);
end

Et=error_pred(predt,Y_train,pred,Y_test); % Error of test data

%% Figures
[k,ind]=sort(Y_test);

figure
plot(1:length(Y_test),pred(ind),'Color',[0.4940 0.1840 0.5560])
hold on
plot(1:length(Y_test),k,'--','Color',[0.4660 0.6740 0.1880])
xlabel('Test Data Samples');ylabel('Price')
legend('Predicted price','Actual price')
hold off

if y==1 || y==2
figure
semilogy(0:length(E)-1,E,'Color',[0.4940 0.1840 0.5560])
hold on
semilogy(find(E==Em)-1,Em,'.','Color',[0.4660 0.6740 0.1880],'MarkerSize',16)
xlabel('Iteration');
if y==1
    ylabel('MAPE %')
elseif y==2
    ylabel('Average Error')
end
legend('$E_N$','$E_{N^*}$','Interpreter','latex')
hold off
end
