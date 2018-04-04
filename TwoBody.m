function Xdot = TwoBody(t,X)
%
% Inputs: t - time (s)
%         X - state vector of position (km) and velocities (km/s)
%
% Outputs: Xdot - derivative of state vector
%
mu = 3.986004415*10^5;

r = X(1:3);
v = X(4:6);

rabs = norm(r);

dr = v;
dv = -mu/(rabs)^3*r;

Xdot = [dr;dv];
end