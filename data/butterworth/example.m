clc;clear;close all
load data_example.mat

cutoff_frequency = 15;
sampling_frequency = 1000;
data_raw = line;

[data] = butterworth(data_raw,sampling_frequency,cutoff_frequency);

figure;
hold on;
plot(line,'k-');
plot(data,'r');
legend({'raw','filtered'});

%%
data_raw = {line;line};
data = cellfun(@(x) butterworth(x,sampling_frequency,cutoff_frequency),...
    data_raw,'UniformOutput',false);