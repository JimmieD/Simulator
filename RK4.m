function output = RK4(t,X,h,tf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inputs:
%           h - step size
%           t - initial time value
%           tf- end time value
%           X - position and velocity initial value vector
%
% outputs:
%           Xn - position and velocity next value vector
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output(1:7) = [1,X(1,1),X(2,1),X(3,1),X(4,1),X(5,1),X(6,1)];

for i = 2:1:tf

    A = transpose(output(i-1,2:7));

    k1 = h*TwoBody(t,A);
    k2 = h*TwoBody(t+h/2,A+k1/2);
    k3 = h*TwoBody(t+h/2,A+k2/2);
    k4 = h*TwoBody(t+h,A+k3);

Xn = A+1/6*(k1+2*k2+2*k3+k4);

output(i,1:7) = [i,Xn(1,1),Xn(2,1),Xn(3,1),Xn(4,1),Xn(5,1),Xn(6,1)];

end


end