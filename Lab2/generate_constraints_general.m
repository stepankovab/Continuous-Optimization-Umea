function constraints = generate_constraints_general(x)
%GENERATE_CONSTRAINTS_GENERAL Summary of this function goes here
%   Detailed explanation goes here

    for i = 1:10
        for j = i+1:10
            g = @(x) (2 * x(11))^2 - (x(i) - x(j))^2 - (x(i) - x(j))^2
        end
    end

    g1 = @(x, radius) (2 * radius)^2 - (x(1) - x(2))^2 - (x(3) - x(4))^2;
    g2 = @(x) x(5) - x(1);
    g3 = @(x) x(5) - x(2);
    g4 = @(x) x(5) - x(3);
    g5 = @(x) x(5) - x(4);
    
    g6 = @(x) x(5) + x(1) - 1;
    g7 = @(x) x(5) + x(2) - 1;
    g8 = @(x) x(5) + x(3) - 1;
    g9 = @(x) x(5) + x(4) - 1;

end

