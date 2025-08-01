function ID(parameter)

model = parameter.model;
ID_coordinates_file = parameter.ID_coordinates_file;
ID_force_file = parameter.ID_force_file;
ID_time_range = parameter.ID_time_range;
ID_output_file = parameter.ID_output_file;

if isfield('ID_lowpass_cutoff_frequency',parameter)

    ID_lowpass_cutoff_frequency = parameter.ID_lowpass_cutoff_frequency;

else

    ID_lowpass_cutoff_frequency = 20;

end

if isfield('plot_value',parameter)

    plot_value = parameter.plot_value;

else

    plot_value = false;

end

if isfield('plot_grf',parameter) 

    plot_grf = parameter.plot_grf;

else

    plot_grf = false;

end

if isfield('weight',parameter) 

    weight = parameter.weight;

else

    weight = 75;

end


%%
import org.opensim.modeling.*
model.initSystem();

IDTool = InverseDynamicsTool();
IDTool.setModel(model);
[ID_output_file_path,~] = fileparts(ID_output_file);
IDTool.setResultsDir(ID_output_file_path);
IDTool.setStartTime(ID_time_range(1));
IDTool.setEndTime(ID_time_range(2));

ID_excluded_forces = ArrayStr();
ID_excluded_forces.append('muscles');
IDTool.setExcludedForces(ID_excluded_forces);

ID_externalload(ID_force_file);
IDTool.setExternalLoadsFileName(fullfile(pwd,"ExternalLoads.xml"));

IDTool.setCoordinatesFileName(ID_coordinates_file);
IDTool.setLowpassCutoffFrequency(ID_lowpass_cutoff_frequency);
IDTool.setOutputGenForceFileName(ID_output_file);

IDTool.run();
if plot_value
    ID_value_plot(ID_output_file,weight);
end

if plot_grf
sampling_frequency = 1000;
GRF_plot(ID_force_file,ID_time_range,weight,sampling_frequency);
end