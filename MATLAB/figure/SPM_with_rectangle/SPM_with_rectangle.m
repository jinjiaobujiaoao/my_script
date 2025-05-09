function [indices,p_value] = SPM_with_rectangle(data_all,handle_figure)

path_function = fullfile(pwd,'function');
addpath(genpath(path_function));

number_case = length(data_all)/2;

number_figure_all = 3*number_case*5 - 1;
number_figure_all = round(number_figure_all/6) + number_figure_all;

color_1 = [253, 140, 60] / 255;    
color_2 = [191, 11, 59] / 255;     
color_3 = [28, 66, 89] / 255;      
color_4 = [255, 217, 118] / 255;   
color = {color_1,color_2,color_3,color_4};

tiledlayout(number_figure_all,1,"TileSpacing","none","Padding","compact");

nexttile([2*number_case*4,1]);
hold on;
box off;
for i_case = 1:number_case
    group_1 = cell2mat(data_all((i_case)*2 - 1));
    group_2 = cell2mat(data_all((i_case)*2));

    plot(mean(group_1,1),'LineWidth',1.2,'LineStyle','-','Color',cell2mat(color(i_case)));
    plot(mean(group_2,1),'LineWidth',1.2,'LineStyle','--','Color',cell2mat(color(i_case)));
    
    spm = spm1d.stats.ttest2(group_1,group_2);
    spmi = spm.inference(0.05);
    
    data_z = spmi.z;
    threshold_zstar = spmi.zstar;
    above_threshold = abs(data_z) > threshold_zstar;
    start_indices = find(diff([0, above_threshold]) == 1);
    end_indices = find(diff([above_threshold, 0]) == -1);

    indices.(['start_',num2str(i_case)]) = start_indices;
    indices.(['end_',num2str(i_case)]) = end_indices;
    p_value.(['case_',num2str(i_case)]) = [spmi.p,spmi.zstar];
end
hold off;


xlim(handle_figure.xlim);
xticks(handle_figure.xticks);
xticklabels(handle_figure.xticklabels);
xlabel(handle_figure.xlabel);

ylim(handle_figure.ylim);
yticks(handle_figure.yticks);
yticklabels(handle_figure.yticklabels);
ylabel(handle_figure.ylabel);

ax = gca;
ax.FontName = handle_figure.fontname;
ax.FontSize = handle_figure.fontsize;

nexttile([round(number_figure_all/6),1]);
axis off;

%%
for i_case = 1:number_case
    start_indices = indices.(['start_',num2str(i_case)]);
    end_indices = indices.(['end_',num2str(i_case)]);
    indices.(['start_',num2str(i_case)]) = start_indices - 1;
    indices.(['end_',num2str(i_case)]) = start_indices - 1;

    nexttile([4,1]);
    axis off;

    if ~isempty(start_indices)
        for i_indices = 1:length(start_indices)
            itr_indices_1 = (start_indices(i_indices) - 1)/100;
            itr_indices_2 = (end_indices(i_indices) - 1)/100;
            rectangle('Position', [0, 0, itr_indices_1, 1], 'FaceColor', 'none');
            rectangle('Position', [itr_indices_1, 0, itr_indices_2 - itr_indices_1, 1], 'FaceColor', cell2mat(color(i_case)),'FaceAlpha',0.8);
            rectangle('Position', [itr_indices_2, 0, 1 - itr_indices_2, 1], 'FaceColor', 'none');
        end
    else
        rectangle('Position', [0, 0, 1, 1], 'FaceColor', 'none');
    end

    if i_case ~= number_case
        nexttile;
        axis off;
    end

end




