function bar_group(input)

data_value  = input.data_value;
data_std    = input.data_std;

if isfield(input, 'bar_width_coefficient')

    bar_width_coefficient = input.bar_width_coefficient;

else

    bar_width_coefficient = 50/100;

end

if isfield(input, 'bar_gap_width_coefficient')

    bar_gap_width_coefficient = input.bar_gap_width_coefficient;

else

    bar_gap_width_coefficient = 30/100;

end

if isfield(input, 'bar_color')

    bar_color = input.bar_color;

else

    bar_color = colormap("hot");
    bar_color = bar_color(25:50:250, :);

end

if isfield(input, 'font_size')

    font_size = input.font_size;

else

    font_size = 20;

end

if isfield(input, 'legend_name')

    is_legend = 1;

else

    is_legend = 0;

end

%---------------------------------------------------------------------------------------------------

X = 1:size(data_value,1);

number_group = size(data_value,2);

bar_width       = 1 / number_group * bar_width_coefficient;
bar_gap_width   = bar_width * bar_gap_width_coefficient;

bar_handle_all = gobjects(number_group,1);

for i_bar = 1:number_group

    X_bar = X + ...
        (i_bar - 1) * (bar_width + bar_gap_width) - ...
        (bar_width + bar_gap_width) * (number_group/2 - 0.5);

    bar_handle              = bar(X_bar,data_value(:,i_bar),bar_width);
    bar_handle.FaceColor    = bar_color(i_bar,:);
    bar_handle.EdgeColor    = "none";
    bar_handle.LineWidth    = 2;
    bar_handle_all(i_bar)   = bar_handle;

    errorbar_handle             = errorbar(X_bar,data_value(:,i_bar), data_std(:,i_bar));
    errorbar_handle.LineStyle   = 'none';
    errorbar_handle.Color       = 'k';

end

ax          = gca;
ax.Layer    = 'bottom';
ax.FontSize = font_size;
ax.XTick    = X;

XAxis_excess_length = ...
(1 - ax.XLim(1)) - (bar_width*number_group + bar_gap_width*(number_group - 1))/2;
ax.XLim(1)          = ax.XLim(1) + XAxis_excess_length * 0.75;
ax.XLim(2)          = ax.XLim(2) - XAxis_excess_length * 0.75;

if is_legend

    legend_name  = input.legend_name;
    leg          = legend(bar_handle_all,legend_name);
    leg.Box      = 'off';
    leg.FontSize = font_size;

end