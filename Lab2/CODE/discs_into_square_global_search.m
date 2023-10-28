function area = discs_into_square_global_search(n_discs,num_start_line, repetitions)
%DISCS_INTO_SQUARE_GLOBAL_SEARCH Summary of this function goes here
%   Detailed explanation goes here

    f = @(x) - n_discs * x(2 * n_discs + 1)^2;

    start = starting_points_square(n_discs,num_start_line);
    
    options = optimset('LargeScale','off','TolFun',.001,'MaxIter',repetitions,'MaxFunEvals',repetitions);

    lb = zeros(1,2 * n_discs + 1);
    ub = ones(1,2 * n_discs + 1);

    problem = createOptimProblem('fmincon', 'objective', f, 'x0', start, 'lb', lb, 'ub', ub, 'nonlcon', @generate_constraints_general, 'options', options);

    xopt = run(GlobalSearch, problem);

    area = n_discs * xopt(2 * n_discs + 1)^2 * pi;
       
    plot_square(n_discs, xopt);

end

