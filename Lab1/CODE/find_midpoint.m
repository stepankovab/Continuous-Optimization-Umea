function midpoint = find_midpoint(t_lb, t_ub, fixed_p, threshold, X_points, f, g, eps)
%FIND_MIDPOINT 
    p1 = fixed_p;
    
    x_opt_1 = find_x_opt(p1, t_lb, X_points, f, g, eps);
    x_opt_2 = find_x_opt(p1, t_ub, X_points, f, g, eps);
        
    while t_ub - t_lb > eps
        p2 = (t_lb + t_ub) / 2;
        
        x_opt = find_x_opt(p1, p2, X_points, f, g, eps);
        
        if x_opt(1) < threshold
            t_lb = p2;
        else
            t_ub = p2;
        end
    end
    
    midpoint = (t_lb + t_ub) / 2;
end

