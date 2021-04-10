function YY=predictN(Xz,W,N,z_min,z_max,y_min,y_max)
% function for predicting prices

[row,col]=find(isnan(Xz));
Xz(row,col)=0;
z=Normalization(Xz,z_min,z_max);

Q=Qmatrix(z,size(Xz,2),size(z,1),N);
Y=Q*W; 

YY=(Y+0.5)*(4*y_max-4*y_min)+y_min;