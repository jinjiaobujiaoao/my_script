function [index_start,index_end] = get_phase_index_auto_ones(input)

data_force = input.data_force;
frequency = input.frequency;

if ~isfield(input,'threshold')

    threshold = 10;

else

    threshold = input.threshold;

end

[~, col] = max(data_force);

data_force_flipped = flipud(data_force);
[index_start,~] = find(data_force_flipped(length(data_force) - col : end) < threshold,1);
index_start = col - index_start + 2;

[index_end,~] = find(data_force(index_start + frequency : end) < 10,1);

if isempty(index_end)

    index_end = length(data_force);

else

    index_end = index_start + frequency + index_end;

end