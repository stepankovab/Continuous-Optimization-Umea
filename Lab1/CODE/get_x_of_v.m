function x_opt = get_x_of_v(X_points, L, eps)
%GET_X_OF_V get optimal x by minimizing lagranian with set v

    % init
    x_opt = [X_points(1,1);X_points(1,2)];
    L_opt = L(x_opt(1), x_opt(2));
    X_points_count = size(X_points,1);

    % iterate over starting points x for newton
    for i_x = 1:X_points_count
        x1 = X_points(i_x,1);
        x2 = X_points(i_x,2);

        x_star = newton(L, [x1;x2], eps);

        % save the result if it is better
        if L(x_star(1), x_star(2)) < L_opt
            x_opt = x_star;
            L_opt = L(x_opt(1), x_opt(2));
        end   
    end
end

