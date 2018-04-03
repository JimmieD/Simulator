function calc_sun = sun_position_calc(startdate, stopdate)
%
%
%Orbital Elements:
%
%i = 0.0     
%w = 282.9404 + 4.70935E-5 * d     (degrees)    
%a = 1.000000  (AU)     
%e = 0.016709 - 1.151E-9 * d     
%M = 356.0470 + 0.9856002585 * d   (degrees)
%rs = 149.6e6

j=1;

start=convert_to_jdate(startdate);
stop=convert_to_jdate(stopdate);
ref_date = convert_to_jdate('19991231.0');

start_date = str2double(start);
stop_date=str2double(stop);
count_day = start_date;
disp(start_date);
disp(count_day);
ref_day = str2double(ref_date);

%Fixed orbital elements
i = 0.0;
a=1;
rs = 149.6E6;

sizes = start_date - stop_date;
%sun_calc = zeros(1,sizes);

while count_day < stop_date
    d = count_day - start_date;
    
    w_deg = 282.9404 + (0.0000470935 * d);
    w_rad = deg2rad(w_deg);
    M_deg = 356.0470 + (0.9856002585 * d);
    M_rad = deg2rad(M_deg);
    ex = 0.016709 - ((1.151*10^-9) * d);
    
    Ecc = M_rad + (ex*sin(M_rad)) + (1+(ex*cos(M_rad)));
    xv = cos(Ecc) - ex;
    yv = sqrt(1.0 - ex*ex) * sin(Ecc);
    v = atan2(yv, xv);
    r = sqrt(xv*xv + yv*yv);
    
    longsun = v + w_rad;
    
    xs = r*cos(longsun);
    ys = r*sin(longsun);
    ecl_deg = 23.4393 - (3.563E-7 * d);
    ecl_rad = deg2rad(ecl_deg);
    
    xe = xs * (r * rs);
    ye = ys * cos(ecl_rad) * (r *rs);
    ze = ys * sin(ecl_rad) * (r *rs);

    RA  = atan2(ye, xe);
    Decl = atan2(ze, sqrt(xe*xe+ye*ye));    

    %disp(xe);    
    
    index_day = count_day - start_date;
    
    calc_sun(j,1) = index_day;
    calc_sun(j,2) = xe;
    calc_sun(j,3) = ye;
    calc_sun(j,4) = ze;
    
    j = j +1;
    count_day = count_day + 1;                    % counts up in one day increments
end
dt = count_day-count_day(1,1);

subplot(3,1,1)
plot(calc_sun(:,1),calc_sun(:,2));   %,calc_sun(:,1),calc_sun(:,3),calc_sun(:,1),calc_sun(:,4));
ylabel("x");
title("Sun Position");
subplot(3,1,2)
plot(calc_sun(:,1),calc_sun(:,3));
ylabel("y");
subplot(3,1,3)
plot(calc_sun(:,1),calc_sun(:,4));
ylabel("z");
xlabel("Days since 20060401");
end