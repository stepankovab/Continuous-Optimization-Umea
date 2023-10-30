
n_discs = 40;

lb = zeros(1,3 * n_discs);
ub = ones(1,3 * n_discs);
start = [0.5640 ,  0.0889   , 0.1050 ,   0.4698   , 0.2232 ,   0.2085  ,  0.7376 ,   0.9573  ,  0.9544  ,  0.0369   , 0.8737  ,  0.3420  ,  0.4764,    0.8818  ,  0.9304,    0.2224 ,   0.3911  ,  0.9429 ,   0.3430 ,   0.9607  ,  0.2807 ,   0.0699  ,  0.2234, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.2, 0.3, 0.8, 0.9, 0.2, 0.3, 0.4, 0.5, 0.7447  ,  0.7283 ,   0.1050,    0.0388,    0.1621,    0.7332,    0.5198,    0.2855,    0.1822,    0.2295,    0.7220 ,   0.1054,    0.4654 ,   0.5487,    0.0696 ,   0.4107,    0.2278 ,   0.3844 ,   0.9470 ,   0.6850 ,   0.8703 ,   0.6500 ,   0.0333 , 0.3, 0.2, 0.8, 0.6, 0.5, 0.5, 0.8, 0.6, 0.5, 0.5, 0.5, 0.7, 0.8, 0.9, 0.9, 0.2, 0.1, 0.2553  ,  0.0193 ,   0.1050  ,  0.0388 ,   0.0262  ,  0.1004,   0.0289  ,  0.0427  ,  0.0456  ,  0.0369  ,  0.0553  ,  0.1054  ,  0.0374  ,  0.1182   , 0.0696  ,  0.2224   , 0.0264  ,  0.0571   , 0.0443,    0.0393   , 0.0545   , 0.0613   , 0.0333, 0.01 , 0.01 , 0.01, 0.001, 0.01, 0.001, 0.01, 0.001,0.01, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.023];

ms =  MultiStart('UseParallel',true,'Display','off');
opts = optimoptions('fmincon','Algorithm','sqp');
problem = createOptimProblem('fmincon', 'objective', @f_3, 'x0', start, 'lb', lb, 'ub', ub, 'nonlcon', @constraints_3, 'options', opts);

xopt = run(ms, problem, 10);

refine_solution(xopt, n_discs, problem, 100, ms);