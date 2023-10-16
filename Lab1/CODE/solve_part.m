function x_opt_points = solve_part(P_points,X_points, f, g, eps)
%SOLVE_PART find optimum of function f satisfying g for all points P
   
    P_points_count = size(P_points,1);
    x_opt_points = [ones(P_points_count,1), ones(P_points_count,1)]; % prepare results array  
    
    % iterate over points P on the line
    for i_p = 1:P_points_count
        p1 = P_points(i_p,1);
        p2 = P_points(i_p,2);

        % plot the pear and line
        fimplicit(g,'-','Color','k')
        line([P_points(1,1), P_points(P_points_count,1)],[P_points(1,2), P_points(P_points_count, 2)],'Color','k','LineWidth',1.5)
        hold on
        
        x_opt = find_x_opt(p1, p2, X_points, f, g, eps);
        
        x_opt_points(i_p, 1) = x_opt(1);
        x_opt_points(i_p, 2) = x_opt(2);
        
        % plot the points
        plot(x_opt_points(i_p, 1),x_opt_points(i_p, 2),'* b')
        plot(p1,p2,'* b')
        line([p1, x_opt_points(i_p, 1)],[p2, x_opt_points(i_p, 2)],'Color', 'r')
        hold on
        line(P_points(1),P_points(P_points_count),'Color','k','LineWidth',1.5)
        xlim([-4,4])
        ylim([-4,4])
        xlabel('x_1')
        ylabel('x_2')
    end
    hold off
end

