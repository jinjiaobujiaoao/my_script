function [index_start,index_end] = get_phase_index(data,threshold,plot_result)
index_all = get_general_phase_index(data);
data_itr = data(index_all.index_1:index_all.index_2);

[index_start,index_end] = get_precision_phase_index(data_itr,threshold);
index_start = index_start + index_all.index_1;
index_end = index_end + index_all.index_1;

if plot_result
    figure;
    set(gcf,'Units','normalized','OuterPosition',[0,0,1,1]);
    plot(data);
    hold on;
    plot(index_start:index_end,0,'ro','MarkerFaceColor','r','MarkerEdgeColor','none','MarkerSize',2);
    plot([index_start,index_end],0,'ro','MarkerFaceColor','r','MarkerEdgeColor','w');
end
end