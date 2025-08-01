function output = get_tiledlayout_index(input)

rows_tile = input.rows_tile;
cols_tile = input.cols_tile;
height = input.height;
length = input.length;
gap_rows = input.gap_rows;
gap_cols = input.gap_cols;

%---------------------------------------------------------------------------------------------------

rows_matrix = (length * rows_tile) + (gap_rows * (rows_tile - 1));
cols_matrix = (height * cols_tile) + (gap_cols * (cols_tile - 1));
matrix = reshape(1:rows_matrix *cols_matrix , cols_matrix, rows_matrix)';


number_tile_all = rows_tile * cols_tile;
index_all = zeros(number_tile_all,1);

for i_tile = 1:number_tile_all

    index_cols_tile = ceil(i_tile / rows_tile);

    if mod(i_tile,rows_tile) ~= 0

        index_rows_tile = mod(i_tile,rows_tile);

    else

        index_rows_tile = rows_tile;

    end

    index_cols = (length * (index_rows_tile - 1)) + (gap_rows * (index_rows_tile - 1)) + 1;
    index_rows = (height * (index_cols_tile - 1)) + (gap_cols * (index_cols_tile - 1)) + 1;


    index_all(i_tile) = matrix(index_cols,index_rows);

end

index_all = reshape(index_all,rows_tile,cols_tile);
output.index_all = index_all;
output.tile_rows = rows_matrix;
output.tile_cols = cols_matrix;

end
