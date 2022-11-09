% Code to plot simulation results from ssc_mass_spring_damper_control
%% Plot Description:
%
% The plots below show the position of the mass and the forces acting on
% the mass.

% Copyright 2015-2019 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_ssc_mass_spring_damper_control', 'var')
    sim('ssc_mass_spring_damper_control')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_ssc_mass_spring_damper_control', 'var') || ...
        ~isgraphics(h1_ssc_mass_spring_damper_control, 'figure')
    h1_ssc_mass_spring_damper_control = figure('Name', 'ssc_mass_spring_damper_control');
end
figure(h1_ssc_mass_spring_damper_control)
clf(h1_ssc_mass_spring_damper_control)

% Get simulation results
simlog_t = simlog_ssc_mass_spring_damper_control.Spring.f.series.time;
simlog_fspr  = simlog_ssc_mass_spring_damper_control.Spring.f.series.values('N');
simlog_fdam  = simlog_ssc_mass_spring_damper_control.Damper.f.series.values('N');
simlog_fsrc  = simlog_ssc_mass_spring_damper_control.Force_Source.f.series.values('N');
simlog_xmass = simlog_ssc_mass_spring_damper_control.Spring.x.series.values('m');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_xmass, 'LineWidth', 1)
grid on
title('Mass Position')
ylabel('Position (m)')

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, -simlog_fsrc, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_fspr, 'LineWidth', 1)
plot(simlog_t, simlog_fdam, 'LineWidth', 1)
grid on
title('Forces')
ylabel('Force (N)')
xlabel('Time (s)')
legend({'Source','Spring','Damper'},'Location','Best');

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_fspr simlog_fdam simlog_fsrc simlog_xmass simlog_handles
