%disks_into_square_fmincon(5, 5)

circles = 8;
s_points = 4;
loop_iter = 30;
iter = 1e12;


max_area = 0;
xopt = zeros(1, 2 * circles + 1);

x = starting_points_quatercircle(circles, s_points);

for i = 1:loop_iter
    [a, x] = discs_into_quater_circle(circles, iter, x);
    if a > max_area
        max_area = a
        xopt = x
        plot_square(circles, xopt);
    end
end

x = max_area
