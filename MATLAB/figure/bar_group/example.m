clc;clear;close all

number_test_case = 3;

switch number_test_case

    case 1

        % 一组
        input.data.value = [14;13;20;16];
        input.data.std = [1;4;5;6];
        input.data.p = [0.005,0.3,0.011,0.7];

    case 2

        % 两组
        input.data.value = [14,17;13,18;20,15;16,19];
        input.data.std = [1,2;4,1;5,4;6,4];
        input.data.p = [0.005,0.3,0.011,0.7];

    case 3

        % 三组
        input.data.value = [14,17,17;13,18,17;20,15,17;16,19,17];
        input.data.std = [1,2,2;4,1,2;5,4,2;6,4,2];
        input.data.p = [0.005,0.3,0.011,0.7];

end

%--------------------------------------------------------------------------

input.legend = {'\fontname{Times New Roman}group 1','group 2','group 3'};
input.xticklabels = {'\fontname{Times New Roman}case 1','case 2','case 3','case 4'};
input.FontSize = 30;

input.bar_color =  [
    [218,238,200]/256;
    [159,217,192]/256;
    [159,217,192]/256];

% input.bar_width_coefficient = 50/100;
% input.bar_gap_width_coefficient = 3/10;

input.xline_color = [0,0,0]/256;

figure;
hold on;
bar_group(input);


% set(gcf,'Units','normalized','OuterPosition',[0,0,1,1]);