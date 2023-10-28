function start = starting_points_square(n_discs,num_start_line)
%GENERATE_STARTING_POINTS Summary of this function goes here
%   Detailed explanation goes here
start = zeros(1, 2 * n_discs + 1);
    s = 1;
    for i = 1:num_start_line
        for j = 1:n_discs / num_start_line
            start(s) = (i) / (num_start_line + 1);
            start(n_discs + s) = (j) / (n_discs / num_start_line + 1);
            s = s + 1;
        end
    end
    start(2 * n_discs + 1) = 1 / (max(num_start_line, n_discs / num_start_line) + 1);
end

