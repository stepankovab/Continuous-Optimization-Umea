function neg_area = f_3(x)
%F_3 Summary of this function goes here
%   Detailed explanation goes here

    n = (length(x)) / 3;
    neg_area = 0;

    for i = 1:n
        neg_area = neg_area - x(2*n + i)^2;
    end

end

