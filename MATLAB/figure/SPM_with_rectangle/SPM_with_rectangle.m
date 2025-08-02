function handles_fig = SPM_with_rectangle(input)

data = input.data;
index_all = input.index_all;

if isfield(input, 'number_title')

    number_title = input.number_title;

else

    number_title = 5;

end

if isfield(input, 'number_figure_1')

    number_figure_1 = input.number_figure_1;

else

    number_figure_1 = 30;

end

if isfield(input, 'number_figure_2')

    number_figure_2 = input.number_figure_2;

else

    number_figure_2 = 4;

end

if isfield(input, 'number_gap_1')

    number_gap_1 = input.number_gap_1;

else

    number_gap_1 = 10;

end

if isfield(input, 'number_gap_2')

    number_gap_2 = input.number_gap_2;

else

    number_gap_2 = 1;

end

if isfield(input, 'group_color')

    group_color = input.group_color;

else

    group_color = [
        88 , 140, 194;
        142, 111, 145;
        196,  82,  97]...
        /256;

end

if isfield(input, 'box_color')

    box_color = input.box_color;

else

    box_color = [0.7, 0.7, 0.7];

end

if isfield(input, 'line_width')

    line_width = input.line_width;

else

    line_width = 2;

end

%%

number_compare_case = size(data, 1);
number_data_length = size(data, 2);
number_cols = 1;
number_rows = ...
    number_title + ...
    number_figure_1 + ...
    number_figure_2 * number_compare_case + ...
    number_gap_1 + ...
    number_gap_2 * number_compare_case;

%---------------------------------------------------------------------------------------------------

tiledlayout(number_rows, number_cols, 'TileSpacing', 'none', 'Padding', 'none');
nexttile([number_title, 1]);
axis off;

handles_fig = nexttile([number_figure_1, 1]);
hold on;

for i_compare_case = 1:number_compare_case

    plot(squeeze(data(i_compare_case, :)), ...
        'Color', group_color(i_compare_case, :), ...
        'LineWidth', line_width);

end

handles_fig.LineWidth = 2;
handles_fig.TickDir = 'out';

handle_axis = gca;
handle_axis.FontSize = 15;
handle_axis.FontName = 'Times New Roman';
handle_axis.Layer = 'top';
handle_axis.XLim = [1, number_data_length];

nexttile([number_gap_1, 1]);
axis off;

%---------------------------------------------------------------------------------------------------

for i_compare_case = 1:number_compare_case

    nexttile([number_figure_2, 1]);
    box on;

    ylabel( ...
        ['\fontname{Times New Roman}', char(64 + i_compare_case)], ...
        'Rotation', 360, ...
        'FontWeight', 'bold', ...
        'FontSize', 20);

    handle_axis = gca;
    handle_axis.XLim = [0, 100];
    handle_axis.YLim = [0, 100];
    handle_axis.XTick = [];
    handle_axis.YTick = [];


    index = index_all{i_compare_case};

    rectangle( ...
        'Position', [0, 0, 100, 100], ...
        'FaceColor', 'none', ...
        'EdgeColor', box_color, ...
        'LineWidth', 2);

    if ~isempty(index)

        index_start_all = index(:, 1);
        index_end_all = index(:, 2);

        for i_index = 1:length(index_start_all)

            rectangle_x = 100 * index_start_all(i_index) / number_data_length;
            rectangle_y = 0;
            rectangle_length = 100 * index_end_all(i_index) / number_data_length - rectangle_x;
            rectangle_height = 100;

            rectangle( ...
                'Position', ...
                [rectangle_x, rectangle_y, ...
                rectangle_length, rectangle_height], ...
                'FaceColor', box_color, ...
                'EdgeColor', box_color, ...
                'LineWidth', 2);

            box on;

        end

    end

    nexttile([number_gap_2, 1]);
    axis off;

end

end