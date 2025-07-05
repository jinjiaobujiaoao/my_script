function [index_start,index_end] = get_precision_phase_index(data,threshold)
index = data > threshold;
index = diff(index);
index_start = find(index > 0,1);
index_end = find(index < 0,1);
end