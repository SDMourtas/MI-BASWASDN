function E=error_pred(X,Y)

R=(X-Y)./Y;
[row,col]=find(isnan(R)); R(row,col)=0;
[row,col]=find(isinf(R)); R(row,col)=0;

E=100/length(R)*sum(abs(R)); % MAPE
fprintf('The test data MAPE is: %f %%\n',E)