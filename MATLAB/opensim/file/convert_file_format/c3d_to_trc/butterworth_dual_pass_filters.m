% 双通Butterworth滤波函数，输入一列原数据、样本频率、截止频率、滤波频率，返回原数据与滤波后数据
function [data_butter_array] = butterworth_dual_pass_filters(columnData,sampling_frequency,cutoff_frequency,filter_passes)
% Maintain the cutoff frequency by adjusting for multiple passes (10 Hz becomes 12.4650 Hz).
c_butter = 1 / (((2^(1/filter_passes))-1)^(1/4));
f_adjusted_butter = cutoff_frequency * c_butter;

% Use Matlab commands to create a Butterworth filter.
[B, A] = butter(2, f_adjusted_butter / (sampling_frequency / 2), 'low');

% Instead of relying on Matlab, let’s code our own Butterworth filter.
% First we need to calculate the coefficients for the second order filter.
w_adjusted_butter = tan(pi*f_adjusted_butter/sampling_frequency);
k1_butter = sqrt(2) * w_adjusted_butter;
k2_butter = w_adjusted_butter^2;

a0_butter = k2_butter / (1 + k1_butter + k2_butter);
a1_butter = 2 * a0_butter;
a2_butter = a0_butter;

b1_butter = 2 * a0_butter * (1/k2_butter - 1);
b2_butter = 1 - (a0_butter + a1_butter + a2_butter + b1_butter);


B_manual_butter = [ a0_butter a1_butter a2_butter ];
A_manual_butter = [ 1 -b1_butter -b2_butter ];
% display(B);
% display(B_manual_butter);
% display(A);
% display(A_manual_butter);

% Open a column of data to filter
% t = open('data_raw_array.mat');
data_raw_array = columnData;
data_raw_copy_array = data_raw_array;
% Now filter the data.
data_butter_array = ones(size(data_raw_array)) .* NaN;

% First pass in the forward direction.
for x = 1:size(data_raw_array,1)
if (x >= 3)
data_butter_array(x) = a0_butter*data_raw_array(x) + a1_butter*data_raw_array(x-1) + a2_butter*data_raw_array(x-2) + b1_butter*data_butter_array(x-1) + b2_butter*data_butter_array(x-2);
elseif (x == 2)
data_butter_array(x) = a0_butter*data_raw_array(x) + a1_butter*data_raw_array(x-1) + b1_butter*data_butter_array(x-1);
else
data_butter_array(x) = a0_butter*data_raw_array(x);
end
end

% Flip the data for the second pass.
data_raw_array = data_butter_array(end:-1:1);
data_butter_array = ones(size(data_raw_array)) .* NaN;

% Second pass.
for x = 1:size(data_raw_array,1)
if (x >= 3)
data_butter_array(x) = a0_butter*data_raw_array(x) + a1_butter*data_raw_array(x-1) + a2_butter*data_raw_array(x-2) + b1_butter*data_butter_array(x-1) + b2_butter*data_butter_array(x-2);
elseif (x == 2)
data_butter_array(x) = a0_butter*data_raw_array(x) + a1_butter*data_raw_array(x-1) + b1_butter*data_butter_array(x-1);
else
data_butter_array(x) = a0_butter*data_raw_array(x);
end
end

% Flip the data back.
data_butter_array = data_butter_array(end:-1:1);


