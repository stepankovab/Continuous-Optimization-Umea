function [area, xopt] = discs_3(n_discs, start)
%DISCS_INTO_QUATER_CIRCLE Summary of this function goes here
%   Detailed explanation goes here
    
    options = optimoptions('fmincon','Algorithm','sqp');

    lb = zeros(1,3 * n_discs);
    ub = ones(1,3 * n_discs);

    problem = createOptimProblem('fmincon', 'objective', @f_3, 'x0', start, 'lb', lb, 'ub', ub, 'nonlcon', @constraints_3, 'options', options);

    xopt = run(GlobalSearch, problem);

    area = density_3(xopt);

end
