function plot_with_std(data_mean,data_std,color_shadow)

if nargin < 3 || isempty(color_shadow)
    color_shadow = [0,0,0];
end

bound_upper = data_mean + data_std; 
bound_lower = data_mean - data_std; 

data_length = 1:size(data_mean, 1);
fill([data_length, fliplr(data_length)], [bound_upper', fliplr(bound_lower')], ...
    color_shadow,'FaceAlpha', 0.2, 'EdgeColor', 'none'); 

plot(data_mean, 'k-', 'LineWidth', 2);

end
