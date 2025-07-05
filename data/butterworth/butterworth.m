function [data_filtered] = butterworth(data_raw, sampling_frequency, cutoff_frequency)
    [B, A] = butter(2, cutoff_frequency / (sampling_frequency / 2), 'low');
    data_filtered = filtfilt(B, A, data_raw);
end