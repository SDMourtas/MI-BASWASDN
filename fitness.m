function E=fitness(X,Y,H,M,D,H1,H2)
% fitness function

D(D<0)=[];
Q=Qmatrix(X,M,H,D);
W=pinv(Q(1:H1,:))*Y(1:H1); % WDD method
E=100/H2*sum(abs((Q(H1+1:H,:)*W-Y(H1+1:H))./Y(H1+1:H))); % MAPE