function [area, xopt] = discs_3(n_discs, repetitions)
%DISCS_INTO_QUATER_CIRCLE Summary of this function goes here
%   Detailed explanation goes here

    f = @(x) 1 - n_discs * x(2 * n_discs + 1)^2;

    %start = starting_points_quatercircle(n_discs,num_start_line);
    
    options = optimset('LargeScale','off','TolFun',.001,'MaxIter',repetitions,'MaxFunEvals',repetitions);

    lb = zeros(1,2 * n_discs + 1);
    ub = ones(1,2 * n_discs + 1);

    %problem = createOptimProblem('fmincon', 'objective', f, 'x0', start, 'lb', lb, 'ub', ub, 'nonlcon', @constraints_3, 'options', options);

    %xopt = run(GlobalSearch, problem);

    xopt = ga(f,2 * n_discs + 1,[],[],[],[],lb,ub,@constraints_3,options);

    area = (4 / pi) * (n_discs * xopt(2 * n_discs + 1)^2 * pi);
       
    %plot_square(n_discs, xopt);

end
