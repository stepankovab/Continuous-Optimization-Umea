g = @(x1, x2) (x1^2 + x2^2) * (1 + 2 * x1 + 5 * x1^2 + 6 * x1^3 + 6 * x1^4 + 4 * x1^5 + x1^6 - 3 * x2^2 + 2 * x2^4 + x2^6 - 2 * x1 * x2^2 + 4 * x1 * x2^4 + 8 * x1^2 * x2^2 + 3 * x1^2 * x2^4 + 8 * x1^3 * x2^2 + 3 * x1^4 * x2^2) - 2;

d = @(x1, x2, p1, p2) (x1 - p1)^2 + (x2 - p2)^2;
D = @(x1, x2, p1, p2) - (x1 - p1)^2 - (x2 - p2)^2;

eps = 10^(-4);

%%

P_points_count = 41; % number of points from which we look for the min/max distance
X_points_per_line_count = 10; % number of starting points for the newton's method for each line

down_line = create_line(-2, 0.3, 0, -1, X_points_per_line_count);
up_line = create_line(-2, -0.3, 0, 1, X_points_per_line_count);
right_line = create_line(0.3, 0, 0.3, 1.2, X_points_per_line_count);
X_points = [right_line]; % combine lines going along the edges of g

% horizontal max
%P_points = create_line(-2, 1.5, 1, 1.5, P_points_count);
%X_opt_points = solve_part(P_points, X_points, D, g, eps)

% horizontal min
%P_points = create_line(-2, 1.5, 1, 1.5, P_points_count);
%X_opt_points = solve_part(P_points, X_points, d, g, eps)


% vertical max
%P_points = create_line(1, 4, 1, -4, P_points_count);
%X_opt_points = solve_part(P_points, X_points, D, g, eps)

% vertical min
P_points = create_line(1, 4, 1, -4, P_points_count);
X_opt_points = solve_part(P_points, X_points, d, g, eps)


t = (linspace(-4,4,P_points_count));
dplot(t, X_opt_points, P_points);

%%

t = find_midpoint(2.5, 3, 1, -1, down_line, D, g, eps)
