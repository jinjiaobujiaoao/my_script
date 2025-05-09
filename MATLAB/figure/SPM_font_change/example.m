clear;clc;close all
path_function = fullfile(pwd,'function');
addpath(genpath(path_function));

number_case = 2;

if number_case == 1
    % 独立样本t检验
    dataset = spm1d.data.uv1d.t1.Random();
    [Y,mu]  = deal(dataset.Y, dataset.mu);

    spm       = spm1d.stats.ttest(Y - mu);
    spmi      = spm.inference(0.05, 'two_tailed',false);

    spmi.plot();
    spmi.plot_threshold_label();
    spmi.plot_p_values();
elseif number_case ~= 1
    % 三因素重复测量方差分析
    dataset    = spm1d.data.uv1d.anova3rm.SPM1D_ANOVA3RM_2x2x2();

    [Y,A,B,C,SUBJ]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);

    spmlist   = spm1d.stats.anova3rm(Y, A, B, C, SUBJ);
    spmilist  = spmlist.inference(0.05);
    spmilist.plot('plot_threshold_label',true, 'plot_p_values',true, 'autoset_ylim',true);

    disp(spmilist);
end


%%
figure_handle.fontsize = 24;
figure_handle.fontname = 'Times New Roman';
figure_handle.figure_current = gcf;
figure_handle.position_text = [0.5,0.9,0];
figure_handle.parameter_significant = 0.0167;
SPM_font_change(figure_handle);

