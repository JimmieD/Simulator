function julian_date = convert_to_jdate(time)
%YYYYMMDD.HHMMSSmmm
%disp(time);

yyyy=extractBetween(time, 1, 4);
mm=extractBetween(time, 5, 6);
dd=extractBetween(time,7,8);
ymd = extractBetween(time, 1, '.');
ymd = str2double(ymd);

if length(time) >= 11
    hh=extractBetween(time,10,11);
    hour=str2double(hh);
else 
    hour = 0;
    minute = 0;
    second = 0;
    mmm = 0;
end

if length(time) >= 13
    min=extractBetween(time,12,13);
    minute=str2double(min);
else
    minute = 0;
    second = 0;
    mmm = 0;
end

if length(time) >= 15
    sec=extractBetween(time,14,15);
    second=str2double(sec);
else
    second = 0;
    mmm = 0;
end

if length(time) >= 18
    mmm=extractBetween(time,16,18);
    milisec = str2double(mmm);
else
    mmm = 0;
end

%frac = extractBetween(time,10,18);
%fracd = str2double(frac);

if (ymd/10000000) < 1
    year = str2double(extractBetween(time,1,2));
else
    year = str2double(yyyy);
end

if year < 50
    year = year + 2000;
else if year >= 50 && year <= 99
        year = year + 1900;
    end
end
%disp(year);

month = str2double(mm);
day = str2double(dd);
hour_to_sec = hour*60*60;
min_to_sec= minute*60;
milisec_to_sec = second/1000;

fraction_of_day = (hour_to_sec + min_to_sec + second + milisec_to_sec)/86400;

L = fix((month - 14)/12);

jdate = day - 32075 + fix(1461*(year + 4800 + L)/4) + fix(367*(month-2 - L*12)/12)-fix(3*fix(((year + 4900 + L)/100)/4));
jdate = jdate + fraction_of_day;
julian_date = num2str(jdate);
%disp(julian_date);

end