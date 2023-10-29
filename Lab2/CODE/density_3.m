function den = density_3(x)
%DENSITY_3 Summary of this function goes here
%   Detailed explanation goes here

    n = (length(x)) / 3;
    circle_area = 0;

    for i = 1:n
        circle_area = circle_area + (pi * x(2*n + i)^2);
    end

    to_fill_area = 1 - (pi * (1/4)^2) - 1/4 * (pi * (1/4)^2) - ((1/3)^2 / 2);

    den = circle_area / to_fill_area;

end

