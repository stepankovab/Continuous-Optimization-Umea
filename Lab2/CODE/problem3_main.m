s_points = 5;
loop_iter = 15;
start_iter = 100;
max_area = 0;
max_circles = 0;

for circles = 36:37
    xopt = zeros(1, 2 * circles + 1);
    %x = starting_points_3(circles, s_points);  
    x = [0.5640 ,  0.0889   , 0.1050 ,   0.4698   , 0.2232 ,   0.2085  ,  0.7376 ,   0.9573  ,  0.9544  ,  0.0369   , 0.8737  ,  0.3420  ,  0.4764,    0.8818  ,  0.9304,    0.2224 ,   0.3911  ,  0.9429 ,   0.3430 ,   0.9607  ,  0.2807 ,   0.0699  ,  0.2234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.7447  ,  0.7283 ,   0.1050,    0.0388,    0.1621,    0.7332,    0.5198,    0.2855,    0.1822,    0.2295,    0.7220 ,   0.1054,    0.4654 ,   0.5487,    0.0696 ,   0.4107,    0.2278 ,   0.3844 ,   0.9470 ,   0.6850 ,   0.8703 ,   0.6500 ,   0.0333 , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.2553  ,  0.0193 ,   0.1050  ,  0.0388 ,   0.0262  ,  0.1004,   0.0289  ,  0.0427  ,  0.0456  ,  0.0369  ,  0.0553  ,  0.1054  ,  0.0374  ,  0.1182   , 0.0696  ,  0.2224   , 0.0264  ,  0.0571   , 0.0443,    0.0393   , 0.0545   , 0.0613   , 0.0333, 0 , 0 , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    for i = 1:start_iter  
        for j = 1:loop_iter
            [a, x] = discs_3(circles, x);
        
            if a > max_area
                max_area = a
                xopt = x
                plot_3(circles, xopt);
                max_circles = circles
            end
        end

        smallest_r = inf;
        smallest_r_i = 0;
        for r = 1:circles
            if xopt(2*circles + r) < smallest_r
                smallest_r_i = r;
                smallest_r = xopt(2*circles + r);
            end
        end

        xopt(smallest_r_i) = rand();
        xopt(circles + smallest_r_i) = rand();
    end
end

aaaa = max_area
ccccc = max_circles


