function [area, xopt] = discs_3(n_discs, start)
%DISCS_INTO_QUATER_CIRCLE Summary of this function goes here
%   Detailed explanation goes here

    f = @(x)- x(2 * n_discs + 1)^2;

    %start = starting_points_quatercircle(n_discs,num_start_line);
    
    options = optimoptions('fmincon','Algorithm','sqp');

    lb = zeros(1,2 * n_discs + 1);
    ub = ones(1,2 * n_discs + 1);




    %Disks constrained to positive quadrant
    %A = zeros(2n, 2n + 1);
    %for j = 1:2n
    %    A(j, j) = -1;
    %    A(j, 2n + 1) = 1;
    %end
    %b = zeros(2n, 1);
    %nlc = @(x)constraints_p2_nlc(x, n);
    %f = @(x)-x(2*n + 1);




    problem = createOptimProblem('fmincon', 'objective', f, 'x0', start, 'lb', lb, 'ub', ub, 'nonlcon', @constraints_3, 'options', options);

    xopt = run(GlobalSearch, problem);

    %xopt = ga(f,2 * n_discs + 1,[],[],[],[],lb,ub,@constraints_3,options);

    area = (4 / pi) * (n_discs * xopt(2 * n_discs + 1)^2 * pi);
       
    %plot_square(n_discs, xopt);

end
