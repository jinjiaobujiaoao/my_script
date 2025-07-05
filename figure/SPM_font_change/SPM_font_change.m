function SPM_font_change(figure_handle)

if isfield(figure_handle,'parameter_significant')
    parameter_significant = figure_handle.parameter_significant;
else
    parameter_significant = 0.05;
end


figure_current = figure_handle.figure_current;
font_name = figure_handle.fontname;
font_size = figure_handle.fontsize;
position_text = figure_handle.position_text;

text_all = findall(figure_current, 'Type', 'text');
set(text_all, 'BackgroundColor', 'none');

pattern_1 = '{\\alpha} *= *\{?\d+\.\d+\}? *, \s*(t|F)\*\s*= *\d+\.\d+';
pattern_2 = 'p\s*(<|=)';
pattern_3 = 'SPM\s*\\{\s*(t|F)\s*\\}';
for i = 1:length(text_all)
    text = get(text_all(i), 'String');

    if ~isempty(regexp(text, [pattern_1 '|' pattern_2 '|' pattern_3], 'once'))

        if ~isempty(regexp(text, pattern_1, 'once'))
            text_new = regexprep(text, '(t|F)', '{\\it{$1}}');
            text_new = regexprep(text_new, '\s*=\s*\{?\d+\.\d+\}?\s*,', [' = {',num2str(parameter_significant),'} ,']);
            set(text_all(i),'Units','normalized','Position', position_text);
        elseif ~isempty(regexp(text,pattern_2,'once'))
            text_new = regexprep(text,'p\s*([=|<])\s*','{\\it{P}} $1 ');
        elseif ~isempty(regexp(text,pattern_3,'once'))
            text_new = regexprep(text,pattern_3,'SPM\\{{\\it{$1}}\\}');
        end

        set(text_all(i),'fontname',font_name,'fontsize',font_size);
        set(text_all(i), 'String', text_new, 'Interpreter', 'tex');
    end

end

end
