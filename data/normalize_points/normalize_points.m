function [data_normalized] = normalize_points(data, number_points, method)

if nargin < 2 || isempty(number_points) 
    number_points = 101; 
end

if nargin < 3 || isempty(method) 
    method = 'linear'; 
end

if ~isempty(data)
    index_original = linspace(1, length(data), length(data));
    index_new = linspace(1, length(data), number_points);
    data_normalized = interp1(index_original, data, index_new, method);
    data_normalized = data_normalized';
else
    data_normalized = [];
end

