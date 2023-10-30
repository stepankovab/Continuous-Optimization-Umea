function [x,f] = refine_solution(x, n, problem, iterations, ms)
% refine_solution Refines a solution x to problem by randomly moving the
%   smallest disk. Each x and y coordinate must have a lb and ub
%
% INPUT: 
%   x          Column vector of length 3n. Each disk has center=
%                (x(i), x(i+n)) with radius x(i+2n)
%   n          The total number of disks
%   problem    An OptimProblem to solve
%   iterations The number of iterations of refinement done. Each iteration
%                checks 10 new starting points. All coordinates must hav lb
%                and ub
%   ms         MultiStart object to run
% OUTPUT:
%   x The best solution found to problem
%   f The function value at x, problem.objective(x)
x_best = x;
f_best = problem.objective(x);
for dummy = 1:iterations
    [~, small_i] = min(x((1:n)+2 * n));
    I = [small_i, small_i + n];
    start_pt_matrix = zeros(10, 3 * n) + x';
    lb = reshape(problem.lb(I), 1, 2);
    ub = reshape(problem.ub(I), 1, 2);
    start_pt_matrix(:, I) = rand(10, 2).*(ub - lb) + lb;
    start_pts = CustomStartPointSet(start_pt_matrix);
    [x, f] = run(ms, problem, start_pts);
    if f < f_best
        f_best = f
        x_best = x
    end
end
x = x_best;
f = f_best;
end