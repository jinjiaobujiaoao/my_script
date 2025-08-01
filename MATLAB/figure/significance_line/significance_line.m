function significance_line(input)

coordinate = input.coordinate;
p_value = input.p_value;

if isfield(input, 'horizontal_line_coefficient')

    horizontal_line_coefficient = input.horizontal_line_coefficient;

else

    horizontal_line_coefficient = 1;

end

if isfield(input, 'significant_symbols_gap')

    significant_symbols_gap = input.significant_symbols_gap;

else

    significant_symbols_gap = 0.3;

end

if isfield(input, 'significance_line_height')

    significance_line_height = input.significance_line_height;

else

    significance_line_height = max(coordinate(:, 2)) * 1.1;

end

if isfield(input, 'significance_line_color')

    significance_line_color = input.significance_line_color;

else

    significance_line_color = [0.7, 0.7, 0.7];

end

if isfield(input, 'significance_line_style')

    significance_line_style = input.significance_line_style;

else

    significance_line_style = '--';

end

if isfield(input, 'significance_line_width')

    significance_line_width = input.significance_line_width;

else

    significance_line_width = 1;

end

if isfield(input, 'significance_line_vertical_line_plot')

    significance_line_vertical_line_plot = input.significance_line_vertical_line_plot;

else

    significance_line_vertical_line_plot = true;

end

if isfield(input, 'significant_symbols_font_size')

    significant_symbols.font_size = input.significant_symbols_font_size;

else

    significant_symbols.font_size = 10;

end

%% 

[x_1, x_2, y_1, y_2] = deal(coordinate(1, 1), coordinate(2, 1), coordinate(1, 2), coordinate(2, 2));

significant_symbols.x = (x_2 + x_1) / 2;
significant_symbols.y = significance_line_height;
significant_symbols.gap = significant_symbols_gap;

horizontal_line.length = (x_2 - x_1) * horizontal_line_coefficient;
horizontal_line.x_left = (x_2 + x_1) / 2 - horizontal_line.length / 2;
horizontal_line.x_right = (x_2 + x_1) / 2 + horizontal_line.length / 2;
horizontal_line.y = significance_line_height;

horizontal_line.x_left_l = horizontal_line.x_left;
horizontal_line.x_left_r = horizontal_line.x_left + ...
    horizontal_line.length * (1 - significant_symbols.gap) / 2;

horizontal_line.x_right_r = horizontal_line.x_right;
horizontal_line.x_right_l = horizontal_line.x_right - ...
    horizontal_line.length * (1 - significant_symbols.gap) / 2;

vertical_line.right.x = horizontal_line.x_right;
vertical_line.left.x = horizontal_line.x_left;
vertical_line.right.y = horizontal_line.y;
vertical_line.left.y = horizontal_line.y;

if p_value < 0.05 && p_value >= 0.01

    significant_symbols.str = '*';

elseif p_value < 0.01 && p_value >= 0.001

    significant_symbols.str = '**';

elseif p_value < 0.001

    significant_symbols.str = '***';

end

text(significant_symbols.x, significant_symbols.y * 0.99, ...
    significant_symbols.str, ...
    'FontSize', significant_symbols.font_size, ...
    'FontWeight', 'bold', ...
    'FontName', 'Times New Roman', ...
    'VerticalAlignment', 'middle', ...
    'HorizontalAlignment', 'center');

plot([horizontal_line.x_left_l, horizontal_line.x_left_r], ...
    [1; 1] * horizontal_line.y, ...
    'LineWidth', significance_line_width, ...
    'LineStyle', significance_line_style, ...
    'Color', significance_line_color);

plot([horizontal_line.x_right_l, horizontal_line.x_right_r], ...
    [1; 1] * horizontal_line.y, ...
    'LineWidth', significance_line_width, ...
    'LineStyle', significance_line_style, ...
    'Color', significance_line_color);

if significance_line_vertical_line_plot

    plot([1, 1] * vertical_line.left.x, ...
        [y_1 * 1.02; horizontal_line.y], ...
        'LineWidth', significance_line_width, ...
        'LineStyle', significance_line_style, ...
        'Color',significance_line_color);

    plot([1, 1] * vertical_line.right.x, ...
        [y_2 * 1.02; horizontal_line.y], ...
        'LineWidth',significance_line_width, ...
        'LineStyle', significance_line_style, ...
        'Color',significance_line_color);

end

end
