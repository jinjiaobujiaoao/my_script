function number_target = get_number_target(file_trc,pattern_target)
number_target = 1;
lines = readlines(file_trc);
while ~contains(lines(number_target),pattern_target)
    number_target = number_target + 1; 
end
end