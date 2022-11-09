% Code to plot simulation results from ssc_mass_spring_damper_sl_dbl

% Copyright 2015 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
clc;
try
    figure(h1_ssc_mass_spring_damper_sl_dbl)
catch
    h1_ssc_mass_spring_damper_sl_dbl=figure('Name', 'ssc_mass_spring_damper_sl_dbl');
end

% Generate simulation results if they don't exist
if(~exist('simlog_ssc_mass_spring_damper_sl_dbl','var'))
    sim('ssc_mass_spring_damper_sl_dbl')
end

% Get simulation results
temp_x1_sl=get(logsout_ssc_mass_spring_damper_sl_dbl,'m1_h_sl');
%temp_x2_sl=get(logsout_ssc_mass_spring_damper_sl_dbl,'m2_h_sl');
temp_x1_sc=simlog_ssc_mass_spring_damper_sl_dbl.Spring1.x.series;
%temp_x2_sc=simlog_ssc_mass_spring_damper_sl_dbl.Spring2.x.series;

% Plot results
% ah(1) = subplot(2,1,1);
% plot(temp_x2_sc.time,temp_x1_sc.values,'LineWidth',3)
% hold on
% %plot(temp_x2_sl.Values.Time,temp_x2_sl.Values.Data,'c--','LineWidth',1)
% hold off
% grid on
% title('Position of Mass 2');
% ylabel('Position (m)');
% legend({'Simscape','Simulink'},'Location','Best');

%ah(2) = subplot(2,1,2);
plot(temp_x1_sc.time,temp_x1_sc.values,'LineWidth',3)
hold on
plot(temp_x1_sl.Values.Time,temp_x1_sl.Values.Data,'c--','LineWidth',1)
hold off
grid on
xlabel('Time (s)');
ylabel('Position (m)');
title('Position of Mass 1');

%linkaxes(ah,'x');

% Remove temporary variables
clear temp_x1_sl temp_x1_sc temp_x2_sl temp_x2_sc
