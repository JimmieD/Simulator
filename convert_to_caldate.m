function cal_date = convert_to_caldate(time)
%This function convers a Julian date into a calendar datetime.
%Input is the Julian date as a string.
%Output is the Calendar Date as a string.


num_days = extractBetween(time,1,'.');
num_days = str2double(num_days);
day_frac = extractBetween(time,'.',length(time));
day_frac = strcat('.',day_frac);
day_frac = str2double(day_frac);

p = num_days +68569;
q = fix(4*p/146097);
r = p - fix((146097*q + 3)/4);
s = fix(4000*(r+1)/1461001);
t = r - fix(1461*s/4) + 31;
u = fix(80*t/2447);
v = fix(u/11);

year = 100*(q-49)+s+v;
yyyy = num2str(year);
month = u + 2 - 12*v;
mm = num2str(month);
day = t - fix(2447*u/80);
dd = num2str(day);


hours = fix(day_frac * 24);
hh = num2str(hours);
if length(hh) < 2
    hh = strcat('0',hh);
end

minutes_a = (abs((hours - (day_frac*24))*60));
minutes = fix(minutes_a);
mm = num2str(minutes);
if length(mm) < 2
   mm = strcat('0',mm);
end

seconds_a = (minutes_a-floor(minutes_a))*60;
seconds = fix(seconds_a);
ss = num2str(seconds);
if length(ss) < 2
    ss = strcat('0',ss);
end

milisec_a = (seconds_a - floor(seconds_a))*1000;
milisec = fix(milisec_a);
mmm = num2str(milisec);
if length(mmm) < 2
    mmm = strcat('00',mmm);
else if length(mmm) < 3
        mmm = strcat('0',mmm);
    end
end
%disp(mmm);

cal_date = strcat(yyyy,mm,dd,'.',hh,mm,ss,mmm);
%disp(cal_date);

end