function move_all_files(sourceFolder,targetFolder,filer_type)
mkdir(targetFolder); % 创建新文件夹

% 列出源文件夹中的所有 filer_type格式 文件
Files = dir(fullfile(sourceFolder, filer_type)); % 获取所有 filer_type格式 文件

% 循环遍历所有 filer_type格式 文件并将其移动到目标文件夹
for i = 1:length(Files)
    % 获取源文件的完整路径
    sourceFile = fullfile(sourceFolder, Files(i).name);
    
    % 获取目标文件的完整路径
    targetFile = fullfile(targetFolder, Files(i).name);
    
    % 将文件移动到目标文件夹
    movefile(sourceFile, targetFile);
    
    % 显示已移动文件的信息
    fprintf('Moved: %s\n', Files(i).name);
end

disp('所有文件已成功移动到新文件夹.');
end