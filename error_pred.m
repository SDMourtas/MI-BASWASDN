function E=error_pred(XX,YY,X,Y)

R=(XX-YY)./YY; Z=length(R);
[row,col]=find(isnan(R)); R(row,col)=0;
[row,col]=find(isinf(R)); R(row,col)=0;

yh=mean(YY); % test
SStot=sum((YY-yh).^2);
SSres=sum((XX-YY).^2);
R2=1-SSres/SStot;
fprintf('The train data R-squared is: %f \n',R2)

Et=100/Z*sum(abs(R)); % MAPE
fprintf('The train data MAPE is: %f \n',Et)

R=XX-YY;
Et=sum(abs(R))/Z; % MAE
fprintf('The train data MAE is: %f \n',Et)

Et=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The train data RMSE is: %f \n',Et)


R=(X-Y)./Y; Z=length(R);
[row,col]=find(isnan(R)); R(row,col)=0;
[row,col]=find(isinf(R)); R(row,col)=0;

yh=mean(Y); % test
SStot=sum((Y-yh).^2);
SSres=sum((X-Y).^2);
R2=1-SSres/SStot;
fprintf('The test data R-squared is: %f \n',R2)

E=100/Z*sum(abs(R)); % MAPE
fprintf('The test data MAPE is: %f \n',E)

R=X-Y;
E=sum(abs(R))/Z; % MAE
fprintf('The test data MAE is: %f \n',E)

E=sqrt(sum(R.^2)/Z); % RMSE
fprintf('The test data RMSE is: %f \n',E)
