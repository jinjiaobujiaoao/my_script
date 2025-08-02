clc;
clear;
close all;

number_case = 1;

if number_case == 1

    openfig('example_figure_1.fig');

else 

    openfig('example_figure_2.fig');

end

figure_handle.fontsize = 24;
figure_handle.fontname = 'Times New Roman';
figure_handle.figure_current = gcf;
figure_handle.position_text = [0.5,0.9,0];
figure_handle.parameter_significant = 0.0167;

SPM_font_change(figure_handle);

