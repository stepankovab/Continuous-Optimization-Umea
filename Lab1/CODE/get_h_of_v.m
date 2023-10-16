function [h, x_opt] = get_h_of_v(v, L, X_points, eps)
%H_OF_V Give result of the h(v) function.

    % Lagrange with set v
    L_v = @(x1, x2) L(x1, x2, v);   
    
    % Get optimal x for this set v
    x_opt = get_x_of_v(X_points, L_v, eps);
    
    % Evaluate
    h = L_v(x_opt(1), x_opt(2));
end

