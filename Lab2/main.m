%disks_into_square_fmincon(5, 5)

circles = 54;
loop_iter = 30;
iter = 1e12;

xopt = zeros(1, 2 * circles + 1);
max_a = 0;

x = starting_points_quatercircle(circles, 6);
x(2 * circles + 1) = 0.0001;

%x = [0.1013  ,  0.4776 ,   0.2964  ,  0.1814  ,  0.1059   , 0.6349  ,  0.4726  ,  0.2954 ,   0.6007  ,  0.6991  ,  0.8930  ,  0.1051  ,  0.8477   , 0.5046,    0.1008 ,   0.3897   , 0.3029 ,   0.7600  ,  0.1041,    0.7595 ,   0.8462 ,   0.2921  ,  0.4824   , 0.6345,    0.5039  ,  0.6104  ,  0.3385  ,  0.1569,    0.1008  ,  0.6885  ,  0.2966  ,  0.1038   , 0.8924  ,  0.2990   , 0.1063   , 0.4774 ,   0.1000]

for i = 1:loop_iter
    [a, x] = discs_into_quater_circle(circles,iter, x);
    %[a,x] = discs_3(circles, iter)

    plot_square(circles, x);

    if a > max_a
        c = circles
        max_a = a
        xopt = x
    end
end



