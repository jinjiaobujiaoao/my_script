function correlation_heatmap(input)

data_R = input.data_R;
data_P = input.data_P;

if isfield(input, 'font_size')
    
    font_size = input.font_size;

else 

    font_size = 15;

end

if isfield(input, 'bubble_size')
    
    bubble_size = input.bubble_size;

else 
    
    bubble_size = [3, 30];

end

if isfield(input, 'colormap')
    
    color_map = input.color_map;

else 
    
    color_map = [
    88, 140, 194;
    143, 178, 213;
    199, 217, 232;
    227, 236, 245;
    247, 225, 228;
    234, 197, 202;
    215, 138, 151;
    196,  82,  97]/256;

end

%% 

number_rows = size(data_R, 1);
number_cols = size(data_R, 2);

index_X = 1:size(data_R,1);
index_Y = 1:size(data_P,2);

[index_X,index_Y] = meshgrid(index_X,index_Y);
index_Y = flipud(index_Y);

%---------------------------------------------------------------------------------------------------

tiledlayout(1, 1, 'TileSpacing', 'compact', 'Padding', 'compact');
nexttile;

hold on;
box on;

bubblechart(index_X(:), index_Y(:), abs(data_R(:)), data_R(:), 'MarkerFaceAlpha', 1);
bubblesize(bubble_size);

xline(1:number_rows, 'LineStyle', '--', 'LineWidth', 1, 'Color', [0.4, 0.4, 0.4], 'Layer', 'bottom');
yline(1:number_cols, 'LineStyle', '--', 'LineWidth', 1, 'Color', [0.4, 0.4, 0.4], 'Layer', 'bottom');
xlim([0.5, number_cols + 0.5]);
ylim([0.5, number_rows + 0.5]);
xticks(1:number_cols);
yticks(1:number_rows);

parameter_axis = gca;
parameter_axis.TickLength = [0, 0];
parameter_axis.FontSize = font_size;
parameter_axis.FontName = 'Times New Roman';
parameter_axis.FontWeight = 'bold';
parameter_axis.LineWidth = 2;

colorbar;
colormap(color_map);
clim([-1,1]);
handles_colorbar = colorbar;
handles_colorbar.Ticks = linspace(-1,1,9);
handles_colorbar.TickLength = 0;

for i_rows = 1:size(data_R,1)

    for i_cols = 1:size(data_R,2)

        data_itr = data_P(i_rows,i_cols);
        data_itr = round(data_itr,3);

        if data_itr > 0.05

            parameter_P = 0;

        elseif data_itr <= 0.05 && data_itr >= 0.001

            parameter_P = 1;

        elseif data_itr < 0.001

            parameter_P = 2;

        end

        switch parameter_P

            case 0

                text( ...
                    index_X(i_rows,i_cols)                      , ...
                    index_Y(i_rows,i_cols)                      , ...
                    num2str(round(data_R(i_rows, i_cols), 2))   , ...
                    'HorizontalAlignment', 'center'             , ...
                    'FontSize', font_size                       , ...
                    'FontName', 'Times New Roman'               , ...
                    'FontWeight', 'normal'                      );

            case 1

                text( ...
                    index_X(i_rows,i_cols)                      , ...
                    index_Y(i_rows,i_cols)                      , ...
                    num2str(round(data_R(i_rows, i_cols), 2))   , ...
                    'HorizontalAlignment', 'center'             , ...
                    'FontSize', font_size                       , ...
                    'FontName', 'Times New Roman'               , ...
                    'FontWeight', 'bold'                        );

            case 2

                text( ...
                    index_X(i_rows,i_cols)                      , ...
                    index_Y(i_rows,i_cols)                      , ...
                    num2str(round(data_R(i_rows, i_cols), 2))   , ...
                    'HorizontalAlignment', 'center'             , ...
                    'FontSize', font_size                       , ...
                    'FontName', 'Times New Roman'               , ...
                    'FontWeight', 'bold'                        );

        end

    end

end

end