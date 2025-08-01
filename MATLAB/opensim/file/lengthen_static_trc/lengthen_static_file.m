function lengthen_static_file(file_trc, file_trc_new)

number_lines = 5;
number_frames = 1001;
number_frames_all = 1:number_frames;
number_frames_all = number_frames_all';

time = 0:0.005:0.005*(number_frames - 1);
time = time(:);

matrix_original = readmatrix(file_trc,'FileType','text','Delimiter','\t','NumHeaderLines',number_lines);
matrix_new = matrix_original(1,3:end);
matrix_new = repmat(matrix_new,1000,1);
matrix_new = [matrix_new(1,:);matrix_new];
matrix_new = [number_frames_all,time,matrix_new];

lines = readlines(file_trc);
line = split(lines(3));
line(3) = num2str(number_frames);
line(8) = num2str(number_frames);

headers = lines(1:number_lines);
headers(3) = strjoin(line,'\t');

writelines(headers,file_trc_new);
writematrix(matrix_new,file_trc_new,'FileType','text','Delimiter','\t','WriteMode','append');

end
