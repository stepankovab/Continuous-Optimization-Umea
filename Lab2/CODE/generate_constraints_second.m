function [g, geq] = generate_constraints_second(x)
%GENERATE_CONSTRAINTS_SECOND Summary of this function goes here
%   Detailed explanation goes here

    n = (length(x) - 1) / 2;
    m = (3 * n + (n * (n - 1)) / 2);
    geq = [];
    g = zeros(m, 1);
    k = 1;

    for i = 1:n
        for j = i+1:n
            g(k) = (2 * x(2 * n + 1))^2 - (x(i) - x(j))^2 - (x(i + n) - x(j + n))^2;
            k = k + 1;
        end
    end

    for i = 1:n*2
        g(k) = x(2 * n + 1) - x(i);
        k = k + 1;
    end

    for i = 1:n
        g(k) = x(i)^2 + x(n + i)^2 - (- x(2 * n + 1) + 1)^2;
        k = k + 1;
    end
end

