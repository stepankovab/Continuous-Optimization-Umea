f = @(x,y)(x.^2 - y.^2).*(x.^2-1)+4.*(x.^2+y.^2-2*x).^2;

%c = fminbnd(f,x,y)

syms x y

%[X,Y] = meshgrid(linspace(-5,5));
%Z = f(X,Y);
%surf(X,Y,Z)

df = gradient(f(x,y), [x,y]);
df = matlabFunction(df, 'Vars', [x,y]);

dF = @(x) df(x(1),x(2));

dF([2,3])
%a = sqrt(1041)/62 - 7/62;
%b = -1/124 * sqrt(545 * sqrt(1041) - 9209);


f= @(x) (x(1)-x(2))^2;

x0 = [0.5; 2.5];
lb = [0; 2];
ub = [1; 3];
xopt = fmincon(f, x0, [], [], [], [], lb, ub, []);

% logicals
xopt <= ub;
lb <= xopt;

f = @(x) (x(1)-x(3))^2 + (x(2)-x(4))^2;

lb = -inf(4,1);
ub = +inf(4,1);

x0 = [0; 0; 2; 3];
%nlc = @(x) deal([g1(x); g2(x)], []);

g1 = @(x) x(1)^2 + x(2)^2 - 1;
g2 = @(x) (x(3) - 2)^2 + (x(4) - 3)^2 - 1;

%xopt = fmincon(f, x0, [], [], [], [], lb, ub, nlc);

%[gs, hs] = nlc(xopt);

%sqrt(f(xopt)) % distance




%%
syms x

f= @(x) x(3);

p1 = [0,0];
p2 = [1,4];
p3 = [4,2];

g1 = @(x) (x(1) - p1(1))^2 + (x(2) - p1(2))^2 - x(3);
g2 = @(x) (x(1) - p2(1))^2 + (x(2) - p2(2))^2 - x(3);
g3 = @(x) (x(1) - p3(1))^2 + (x(2) - p3(2))^2 - x(3);

nlc = @(x) deal([g1(x),g2(x),g3(x)], []);

lb = [-Inf, -Inf, 0];
ub = +Inf(3,1);

xopt = fmincon(f, [1,2,1], [], [], [], [], lb, ub, nlc);

r = sqrt(xopt(3)) + 1



syms x1 x2 x3;

f= @(x1, x2, x3) x3;
fsym = f(x1, x2, x3)
dfsym = gradient(fsym,[x1, x2, x3])
df = matlabFunction(dfsym, 'Vars', [x1,x2,x3]);

p1 = [0,0];
p2 = [1,4];
p3 = [4,2];

g1 = @(x1, x2, x3) (x1 - p1(1))^2 + (x2 - p1(2))^2 - x3;
g2 = @(x1, x2, x3) (x1 - p2(1))^2 + (x2 - p2(2))^2 - x3;
g3 = @(x1, x2, x3) (x1 - p3(1))^2 + (x2 - p3(2))^2 - x3;


df = gradient(f(xopt(1), xopt(2), xopt(3)), [xopt(1), xopt(2), xopt(3)])

dF = @(x) df(x);

dF([2,3,2])


%% 5


d = @(x) (x(1)-x(3))^2 + (x(2)-x(4))^2;

g1 = @(x) 6 * x(1)^2 + 9 * x(2)^2 + 4 * x(1) * x(2) - 2;
g2 = @(x) 4 * x(3)^2 + 4 * x(4)^2 - 4 * x(3) * x(4) - 20 * x(3) + 4 * x(4) + 25;

lb = -inf(4,1);
ub = inf(4,1);

syms x

nlc = @(x) deal([g1(x),g2(x)], []);

x0 = fmincon(d, [0,0,3,1], [], [], [], [], lb, ub, nlc)

sqrt(d(x0))


g1(x0)
g2(x0)


%% 5

d = @(x1, x2, x3, x4) (x1-x3)^2 + (x2-x4)^2;
g1 = @(x1, x2, x3, x4) 6 * x1^2 + 9 * x2^2 + 4 * x1 * x2 - 2;
g2 = @(x1, x2, x3, x4) 4 * x3^2 + 4 * x4^2 - 4 * x3 * x4 - 20 * x3 + 4 * x4 + 25;

syms x1 x2 x3 x4

grad_d = matlabFunction(gradient(d(x1, x2, x3, x4), [x1, x2, x3, x4]))
grad_g1 = matlabFunction(gradient(g1(x1, x2, x3, x4), [x1, x2, x3, x4]))
grad_g2 = matlabFunction(gradient(g2(x1, x2, x3, x4), [x1, x2, x3, x4]))

grad_d(0.5865,-0.0307,2.0192, 0.3408)
grad_g1(0.5865,-0.0307)
grad_g2(2.0192, 0.3408)

g1(0.5865,-0.0307,2.0192, 0.3408)
g2(0.5865,-0.0307,2.0192, 0.3408)

%%


f1 = @(x) x(1);
f2 = @(x) x(2);
f3 = @(x) -x(1);
f4 = @(x) -x(2);

g = @(x) (x(1) - x(2))^2 + (2 + x(1) + x(2)^2)^2 - 10;

lb = -inf(2,1);
ub = inf(2,1);

nlc = @(x) deal([g(x)], []);

x01 = fmincon(f1, [0,0], [], [], [], [], lb, ub, nlc)
x02 = fmincon(f2, [0,0], [], [], [], [], lb, ub, nlc)
x03 = fmincon(f3, [0,0], [], [], [], [], lb, ub, nlc)
x04 = fmincon(f4, [0,0], [], [], [], [], lb, ub, nlc)

%%
f1 = @(x1,x2) -x2;
g = @(x1, x2) (x1 - x2)^2 + (2 + x1 + x2^2)^2 - 10;

syms x1 x2

grad_f1 = gradient(f1(x1, x2), [x1, x2])
grad_g = matlabFunction(gradient(g(x1, x2), [x1, x2]));
grad_g(-1.0862  ,  1.1499)

g(-1.0862  ,  1.1499)

%% 4

d = @(x) (x(1)-x(3))^2 + (x(2)-x(4))^2;

g1 = @(x) x(1)^2 + (x(2) - 2)^2 - 1;
g2 = @(x) - x(3)^2 + x(4);

lb = -inf(4,1);
ub = inf(4,1);

syms x

nlc = @(x) deal([g1(x)], [g2(x)]);

x0 = fmincon(d, [0,2,1,1], [], [], [], [], lb, ub, nlc)

sqrt(d(x0))
    
g1(x0)
g2(x0)


%% 2

f = @(x1, x2) (x1 - x2)^2 + (2 + x1 + x2^2)^2;

df_sym = gradient(f(x1,x2),[x1,x2]);
df = matlabFunction(df_sym);
[solx1,solx2] = solve(df(x1, x2) == [0,0]);

fx1 = matlabFunction(df_sym(1));
fx2 = matlabFunction(df_sym(2));

dfx1_sym = gradient(fx1(x1, x2), [x1, x2]);
dfx2_sym = gradient(fx2(x1, x2), [x1, x2]);

fx1x1 = matlabFunction(dfx1_sym(1));
fx1x2 = matlabFunction(dfx1_sym(2));
fx2x2 = matlabFunction(dfx2_sym(2));

a = -11/8;
b = -1/2;

p_temp = @(a,b) f(a,b) + fx1(a,b) * (x1 - a) + fx2(a,b) * (x2 - b) + 1/2 * fx1x1() * (x1 - a)^2 + fx1x2(b) * (x1 - a) * (x2 - b) + 1/2 * fx2x2(a,b) * (x2 - b)^2;
% by evaluating p_temp at point (-11/8, -1/2)
p = @(x1,x2) (15*(x2 + 1/2)^2)/4 + 2*(x1 + 11/8)^2 - (4*x1 + 11/2)*(x2 + 1/2) + 49/32;

d_sym = p(x1, x2) - f(x1, x2);
d = matlabFunction(d_sym);

% parametrize d
x1_param1 = @(t) cos(t) - 11/8;
x1_param_sym = x1_param1(t);
x2_param1 = @(t) sin(t) - 1/2;
x2_param_sym = x2_param1(t);

d_param_sym = d(x1_param_sym,x2_param_sym);
d_param = matlabFunction(d_param_sym);

% Find minimum and maximum of d_param(t)

d_param_derivative1 = gradient(d_param(t), t);

% according to the graph, there are 6 roots

root1 = vpasolve(d_param_derivative1,[-2 -1])
root2 = vpasolve(d_param_derivative1,[-1 0.5])
root3 = vpasolve(d_param_derivative1,[0.5 1])
root4 = vpasolve(d_param_derivative1,[1 2.5])
root5 = vpasolve(d_param_derivative1,[2.5 3.25])
root6 = vpasolve(d_param_derivative1,[3.25 4.3])

% evaluate d_param at these points

d_param(root1)
d_param(root2)
d_param(root3)
d_param(root4)
d_param(root5)
d_param(root6)

% root 1 gives minimum

x1_min = x1_param1(root1)
x2_min = x2_param1(root1)

% root 4 gives maximum

x1_max = x1_param1(root4)
x2_max = x2_param1(root4)


d(x1_min, x2_min)
d(x1_max, x2_max)


%% 3.1 by hand


f = @(x1, x2, x3) x1^2 + 3 * x2^2 + 5 * x3^2 - 2 * x1 * x2 + 2 * x1 * x3 - 6 * x2 * x3 + x1 -2 * x2 + 3 * x3;

g1 = @(x1, x2, x3) x1 + x2 + x3 - 1;
g2 = @(x1, x2, x3) x1^2 - x2 + 1;

syms x1 x2 x3 v v1 v2

L1 = @(x1, x2, x3, v) x1^2 + 3 * x2^2 + 5 * x3^2 - 2 * x1 * x2 + 2 * x1 * x3 - 6 * x2 * x3 + x1 -2 * x2 + 3 * x3 + v * (1 - (x1 + x2 + x3))

grad_L1 = gradient(L1(x1, x2, x3, v), [x1, x2, x3, v])

solve(grad_L1 == [0;0;0;0])

% solving parametrization by hand:
x1_param1 = @(v) -v - 1/4;
x2_param1 = @(v) v;
x3_param1 = @(v) (-2 * v - 1)/4;


%h = @(v) L(x1_param(v), x2_param(v), x3_param(v), v)
h1 = @(v) (-v - 1/4)^2 + 3 * (v)^2 + 5 * ((-2 * v - 1)/4)^2 - 2 * (-v - 1/4) * (v) + 2 * (-v - 1/4) * ((-2 * v - 1)/4) - 6 * (v) * ((-2 * v - 1)/4) + (-v - 1/4) -2 * (v) + 3 * ((-2 * v - 1)/4) - v * (1 - ((-v - 1/4) + (v) + ((-2 * v - 1)/4)))

a = fmincon(h1, -100, [], [])

% strong duality

h1(a)

f(x1_param1(a), x2_param1(a), x3_param1(a))
%%

L2 = @(x1, x2, x3, v1, v2) x1^2 + 3 * x2^2 + 5 * x3^2 - 2 * x1 * x2 + 2 * x1 * x3 - 6 * x2 * x3 + x1 -2 * x2 + 3 * x3 + v1 * (1 - (x1 + x2 + x3))

grad_L2 = gradient(L2(x1, x2, x3, v), [x1, x2, x3, v])

solve(grad_L2 == [0;0;0;0])






%% computer 3.1

f = @(x) x(1)^2 + 3 * x(2)^2 + 5 * x(3)^2 - 2 * x(1) * x(2) + 2 * x(1) * x(3) - 6 * x(2) * x(3) + x(1) -2 * x(2) + 3 * x(3);

g1 = @(x) x(1) + x(2) + x(3) - 1;
g2 = @(x) x(1)^2 - x(2) + 1;


L2 = @(x, v) f(x) + v * (0 - g1(x))

xmin = @(v) fminsearch(@(x) Lagrange(x, v), [1,0,0])
h1 = @(v) Lagrange(xmin(v), v)

v = [0]; % pick v
x = xmin(v)
w = h1(v)



%% 3.1 by hand second try


f = @(x1, x2, x3) x1^2 + 3 * x2^2 + 5 * x3^2 - 2 * x1 * x2 + 2 * x1 * x3 - 6 * x2 * x3 + x1 - 2 * x2 + 3 * x3;

g1 = @(x1, x2, x3) x1 + x2 + x3 - 1;
g2 = @(x1, x2, x3) x1^2 - x2 + 1;

syms x1 x2 x3 v v1 v2

L1 = @(x1, x2, x3, v1) f(x1, x2, x3) + v1 * g1(x1, x2, x3);
%L1_sym = L1(x1, x2, x3, v1);

L1_grad = gradient(L1(x1, x2, x3, v1), [x1, x2, x3, v1]);

p1 = solve([L1_grad(1); L1_grad(2); L1_grad(3)] == [0;0;0], [x1,x2,x3]);

x1_p1 = matlabFunction(p1.x1);
x2_p1 = matlabFunction(p1.x2);
x3_p1 = matlabFunction(p1.x3);

h1 = @(v1) L1(x1_p1(v1), x2_p1(v1), x3_p1(v1), v1)
%h1_sym = h1_temp(v1)

h1_grad = gradient(h1(v1), v1)

v0 = solve(h_grad == 0)

h1(v0)
f(x1_p1(v0), x2_p1(v0), x3_p1(v0))




% second




L2 = @(x1, x2, x3, v1, v2) f(x1, x2, x3) + v1 * g1(x1, x2, x3) + v2 * g2(x1, x2, x3)
L2_sym = L2(x1, x2, x3, v1, v2)
grad_L2 = gradient(L2(x1, x2, x3, v1, v2), [x1, x2, x3, v1, v2])

params2 = solve([grad_L2(1); grad_L2(2); grad_L2(3)] == [0;0;0], [x1,x2,x3]);

x1_param2 = matlabFunction(params2.x1);
x2_param2 = matlabFunction(params2.x2);
x3_param2 = matlabFunction(params2.x3);

h2 = @(v) L2(x1_param2(v(1), v(2)), x2_param2(v(1), v(2)), x3_param2(v(1), v(2)), v(1), v(2))
%h2_sym = h2_temp([v1, v2])
%h2 = matlabFunction(h2_sym)

v0 = fmincon(h2, [100,100], [], [])

h2(v0)
f(x1_param2(v0(1), v0(2)), x2_param2(v0(1), v0(2)), x3_param2(v0(1), v0(2)))
%%

h2_grad = gradient(h2(v1, v2), [v1, v2])
v0 = solve(h_grad == 0)
h1(v0)
f(x1_p1(v0), x2_p1(v0), x3_p1(v0))


%% 4 dual

d = @(x) (x(1)-x(3))^2 + (x(2)-x(4))^2;

g1 = @(x) x(1)^2 + (x(2) - 2)^2 - 1;
g2 = @(x) - x(3)^2 + x(4);

lb = -inf(4,1);
ub = inf(4,1);

syms x

nlc = @(x) deal([g1(x)], [g2(x)]);

x0 = fmincon(d, [0,2,1,1], [], [], [], [], lb, ub, nlc)

sqrt(d(x0))
    
g1(x0)
g2(x0)



%% pokus

f = @(x1, x2) x1^2 / 2 + x2^2 / 2;

g1 = @(x1, x2) 4 - x1 - x2;
g2 = @(x1, x2) - 4 - x1 + x2;

syms x1 x2 v1 v2

L = @(x1, x2, v1, v2) f(x1, x2) + v1 * g1(x1, x2) + v2 * g2(x1, x2);
Lag = L(x1, x2, v1, v2)

L_grad = gradient(L(x1, x2, v1, v2), [x1, x2, v1, v2])

p = solve([L_grad(1); L_grad(2)] == [0;0], [x1,x2])
x1_p = matlabFunction(p.x1)
x2_p = matlabFunction(p.x2)

h = @(v1, v2) L(x1_p(v1, v2), x2_p(v1, v2), v1, v2)

h_grad = gradient(h(v1, v2), [v1, v2])

v0 = solve(h_grad == [0;0]);

v1 = v0.v1
v2 = 0

x1 = x1_p(v1, v2)
x2 = x2_p(v1, v2)

h(v1, v2)
f(x1, x2)
