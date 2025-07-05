function [information_spmi] = SPM_get_information(parameter_spm)
switch class(parameter_spm)
    case 'spm1d.stats.spm.SPMi'

        if parameter_spm.two_tailed == 1
            number_case = 1;
        else
            number_case = 0;
        end

    otherwise
        number_case = 0;
end

z = parameter_spm.z;
z_star = parameter_spm.zstar;
if number_case

    [index_start_1,index_end_1] = SPM_get_index(z,z_star);
    [index_start_2,index_end_2] = SPM_get_index( - z,z_star);

    index_start = sort([index_start_1,index_start_2]);
    index_end = sort([index_end_1,index_end_2]);

else

    [index_start,index_end] = SPM_get_index(z,z_star);

end

information_spmi.index_start = index_start;
information_spmi.index_end = index_end;

parameter_spm.zstar = round(parameter_spm.zstar,3);
information_spmi.zstar = parameter_spm.zstar;

index_p = parameter_spm.p < 0.001;
parameter_spm.p(index_p) = 0.001;
parameter_spm.p = round(parameter_spm.p * 1000);
parameter_spm.p = parameter_spm.p / 1000;
information_spmi.p = parameter_spm.p;
end