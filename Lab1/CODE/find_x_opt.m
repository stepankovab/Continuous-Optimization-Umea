function best_x_opt = find_x_opt(p1, p2, X_points, f, g, eps)
%FIND_X_OPT Summary of this function goes here

    L = @(x1,x2,v) f(x1, x2, p1, p2) + v * g(x1,x2);
    best_x_opt = [0,0];
        
    % Initial bounds on v
    v_ub = 10;
    v_lb = 0;

    duality_gap = inf;

    % interval halving until the interval is epsilon or duality gap is
    % less than epsilon
    while v_ub - v_lb > eps
        if duality_gap < eps
            break;
        end
        % compute v and h(v)
        v = (v_ub + v_lb) / 2;
        [h, x_opt] = get_h_of_v(v, L, X_points, eps);

        % compute v + eps and h(v + eps)
        v_eps = v + eps;
        [h_eps, ~] = get_h_of_v(v_eps, L, X_points, eps);

        % halv the interval
        if h > h_eps
            v_ub = v;
        else
            v_lb = v;
        end

        % change optimal point if the new point gives better results
        if abs(f(x_opt(1), x_opt(2), p1, p2) - L(x_opt(1), x_opt(2), v)) < duality_gap
            duality_gap = abs(f(x_opt(1), x_opt(2), p1, p2) - L(x_opt(1), x_opt(2), v)) 
            best_x_opt = x_opt;
        end

    end
end

