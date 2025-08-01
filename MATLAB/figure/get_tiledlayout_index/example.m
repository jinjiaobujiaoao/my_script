clc;
clear;
close all;

input.rows_tile = 3;
input.cols_tile = 6;

input.height = 5;
input.length = 3;

input.gap_rows = 1;
input.gap_cols = 1;

output = get_tiledlayout_index(input);
disp(output);

tiledlayout(output.tile_rows, output.tile_cols, "TileSpacing", "none", "Padding", 'none');

for i_row = 1:input.rows_tile

    for i_col = 1:input.cols_tile 

        nexttile(output.index_all(i_row, i_col), [input.length, input.height]);

    end

end
