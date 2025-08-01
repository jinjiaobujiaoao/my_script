clc;
clear;
close all;

figure;
tiledlayout(1, 3, "TileSpacing", "compact", "Padding", "compact");

%---------------------------------------------------------------------------------------------------

nexttile;
hold on;

bar([1, 2, 3], [4, 5, 6]);
ylim([0, 10]);

input.coordinate = [1, 4; 2, 5];
input.p_value = 0.01;
significance_line(input);

%---------------------------------------------------------------------------------------------------

nexttile;
hold on;

bar([1, 2, 3], [4, 5, 6]);
ylim([0, 10]);

input.coordinate = [1, 4; 3, 6];
input.p_value = 0.0001;
significance_line(input);

%---------------------------------------------------------------------------------------------------

nexttile;
hold on;

bar([1, 2, 3], [4, 5, 6]);
ylim([0, 10]);

input.coordinate = [2, 5; 3, 6];
input.p_value = 0.001;
significance_line(input);