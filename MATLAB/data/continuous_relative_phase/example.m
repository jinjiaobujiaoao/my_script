clc;clear;close all
addpath(fullfile(pwd,'function'));
load example_data.mat

angle_CRP = continuous_relative_phase(angle_value.hip,angle_value.knee);
plot(angle_CRP);
title('CRP_angle_hip_knee','Interpreter','none');
%% 连续相对相位（CRP）计算示意图
close all;
tiledlayout(3,2,'TileSpacing','compact','Padding','compact');

nexttile;
angle_knee = angle_value.knee;
plot(angle_knee);
box off;
title('angle_knee_fiexion','Interpreter','none');

nexttile;
angle_hip = angle_value.hip;
plot(angle_hip);
box off;
title('angle_hip_fiexion','Interpreter','none');

nexttile;
% angle_knee = Phase_Angle(angle_knee);
angle_knee = Hilbert_PA(angle_knee);
plot(angle_knee);
box off;
title('phase_angle_knee_fiexion','Interpreter','none');

nexttile;
% angle_hip = Phase_Angle(angle_hip);
angle_hip = Hilbert_PA(angle_hip);
plot(angle_hip);
box off;
title('phase_angle_hip_fiexion','Interpreter','none');

nexttile([1,2]);
angle_CRP = CRP(angle_hip,angle_knee);
plot(angle_CRP);
box off;
title('CRP_angle_hip_knee','Interpreter','none');