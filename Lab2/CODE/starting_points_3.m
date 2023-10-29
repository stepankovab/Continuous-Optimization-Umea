function start = starting_points_3(n_discs,num_start_line)
%STARTING_POINTS_3 Summary of this function goes here
%   Detailed explanation goes here

    start = zeros(1, 3 * n_discs);
    s = 1;
    for i = 1:num_start_line
        for j = 1:n_discs / num_start_line
            start(s) = (i) / (3 * (num_start_line + 1));
            start(n_discs + s) = (j) / (3 * (n_discs / num_start_line + 1));
            s = s + 1;
        end
        start(2 * n_discs + i) = 1 / (3 * (max(num_start_line, n_discs / num_start_line) + 1));
    end    
end
