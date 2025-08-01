function index = get_phase_index_auto(input)

number_times = input.number_times;
data_force = input.data_force;
frequency = input.frequency;
index = zeros(number_times,2);

if ~isfield(input,'threshold')

    threshold = 10;

else

    threshold = input.threshold;

end


if number_times == 1

    parameter_ones.data_force = data_force;
    parameter_ones.frequency = frequency;

    [index_start,index_end] = get_phase_index_auto_ones(parameter_ones);
    index(1,:) = [index_start,index_end];

elseif number_times > 1

    parameter_ones.data_force = data_force;
    parameter_ones.frequency = 1000;
    parameter_ones.threshold = threshold;

    [index_start,index_end] = get_phase_index_auto_ones(parameter_ones);
    index(1,:) = [index_start,index_end];

    i_times = 1;
    while i_times ~= number_times

        i_times = i_times + 1;
        data_force(index_start:index_end) = 0;
        parameter_ones.data_force = data_force;
        parameter_ones.frequency = 1000;
        parameter_ones.threshold = threshold;
        
        [index_start,index_end] = get_phase_index_auto_ones(parameter_ones);
        index(i_times,:) = [index_start,index_end];

    end

end
