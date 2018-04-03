function Sim01(Bias, Scale_factor, file_path)
%This function computes the quantized sun angles
%
%VARIABLE            I/O     DESCRIPTION
%file_path            I      Path to data.  Enter as s string bracketed with ' '
%Bias                 I      In degrees
%Scale_factor         I      In degrees
%Scale_factor_rad     O      Scale_factor converted to radians
%Bias_rad             O      Bias converted to radians
%counts               O      Sun data converted into counts
%Quantized_Sun_Angles O      
%
%MODIFICATION HISTORY:
%
%02/21/2018: J. Dickey Created
%
%function Q=Sim01(Bias, Scale_factor, file_path)

load(file_path)
Scale_factor_rad = deg2rad(Scale_factor);
Bias_rad = deg2rad(Bias);
counts = fix((sun_angles_radians - Bias_rad)/Scale_factor_rad);
Quantized_Sun_Angles = (Scale_factor_rad*counts)+Bias_rad;

dt = sun_angles_times-sun_angles_times(1,1);
plot(dt,sun_angles_radians,'r-',dt,Quantized_Sun_Angles,'b-')
ylabel('Rad')
xlabel('Time (sec)');
title('Stuff')
end