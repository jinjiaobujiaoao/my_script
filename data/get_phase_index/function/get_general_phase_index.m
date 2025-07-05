function index_all = get_general_phase_index(data)
plot(data);
set(gcf,'Units','normalized','OuterPosition',[0,0,1,1])
index_number = 1;
while true
    try
        [x, ~] = ginput(1);
        hold on;
        plot(x, 0, 'ro','MarkerFaceColor','r','MarkerEdgeColor','none');
        index_all.(['index_',num2str(index_number)]) = round(x);
        index_number = index_number + 1;
    catch
        break;
    end
end

end
