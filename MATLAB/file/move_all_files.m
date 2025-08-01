function move_all_files(sourceFolder,targetFolder,filer_type)

mkdir(targetFolder); 

Files = dir(fullfile(sourceFolder, filer_type));

for i = 1:length(Files)

    sourceFile = fullfile(sourceFolder, Files(i).name);

    targetFile = fullfile(targetFolder, Files(i).name);

    movefile(sourceFile, targetFile);

    fprintf('Moved: %s\n', Files(i).name);
    
end

disp('所有文件已成功移动到新文件夹.');

end