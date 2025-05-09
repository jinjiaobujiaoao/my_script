function index = get_phase_index_by_CWT(parameter)

number_times = parameter.number_times;
data_force = parameter.data_force;
frequency = parameter.frequency;
index = zeros(number_times,2);

if number_times == 1

    parameter_ones.data_force = data_force;
    parameter_ones.frequency = frequency;

    [index_start,index_end] = get_phase_index_auto_ones(parameter_ones);
    index(1,:) = [index_start,index_end];

elseif number_times > 1

    parameter_ones.data_force = data_force;
    parameter_ones.frequency = 1000;

    [index_start,index_end] = get_phase_index_auto_ones(parameter_ones);
    index(1,:) = [index_start,index_end];

    i_times = 1;
    while i_times ~= number_times

        i_times = i_times + 1;
        data_force(index_start:index_end) = 0;
        parameter_ones.data_force = data_force;
        parameter_ones.frequency = 1000;
        [index_start,index_end] = get_phase_index_auto_ones(parameter_ones);
        index(i_times,:) = [index_start,index_end];

    end

end
