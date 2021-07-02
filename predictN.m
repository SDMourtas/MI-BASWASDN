function YY=predictN(Xz,W,N,z_min,z_max,y_min,y_max,y)
% function for predicting prices

[row,col]=find(isnan(Xz));
Xz(row,col)=0;
z=Normalization(Xz,z_min,z_max);

if y==1
    Q=Qmatrix(z,size(Xz,2),size(z,1),N);
elseif y==2
    Q=Qmatrix2(z,size(Xz,2),size(z,1),N);
end
Y=Q*W; 

YY=(Y+0.5)*(4*y_max-4*y_min)+y_min;