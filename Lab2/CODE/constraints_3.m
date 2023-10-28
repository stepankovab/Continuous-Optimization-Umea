function [g, geq] = constraints_3(x)
%GENERATE_CONSTRAINTS_SECOND Summary of this function goes here
%   Detailed explanation goes here

    n = (length(x)) / 3;
    m = (8 * n + (n * (n - 1)) / 2);
    geq = [];
    g = zeros(m, 1);
    k = 1;

    for i = 1:n
        for j = i+1:n
            g(k) = (x(2*n + i) + x(2*n + j))^2 - (x(i) - x(j))^2 - (x(i + n) - x(j + n))^2;
            k = k + 1;
        end
    end

    for i = 1:n
        g(k) = x(2*n + i) - x(i);
        k = k + 1;
        g(k) = x(2*n + i) - x(n + i);
        k = k + 1;
        g(k) = x(2*n + i) + x(i) - 1;
        k = k + 1;
        g(k) = x(2*n + i) + x(n + i) - 1;
        k = k + 1;
    end

    for i = 1:n
        g(k) = x(2*n + i) + 1/4 - sqrt((1 - x(i))^2 + (1 - x(n + i))^2);
        k = k + 1;
        g(k) = x(2*n + i) + 1/4 - sqrt((2/3 - x(i))^2 + (1/4 - x(n + i))^2);
        k = k + 1;
        g(k) = (1 - x(n + i)) + (2/3 + sqrt(2) * x(2*n + i)) - x(i);
        k = k + 1;
        g(k) = x(n + i) - x(i) - (2/3 + sqrt(2) * x(2*n + i));
        k = k + 1;
    end

    

end


