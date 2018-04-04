function output = RK4(t,X,h,tf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RK4(0,[1.939171267526330E3;7.053946077269909E3;5.216461164024867E3;7.728790449144201E-1;-5.188238121076679;3.991379730081099],60,60)
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

subplot(3,1,1);
plot(output(:,1),output(:,2));
subplot(3,1,2);
plot(output(:,1),output(:,3));
subplot(3,1,3);
plot(output(:,1),output(:,4));


end