clc;clear;close all
addpath(genpath(fullfile(pwd,'function')));
preData = rand(1,10);
postData = rand(1,10);
[d,p] = normal_significance_test(preData, postData);