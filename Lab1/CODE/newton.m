function x_star = newton(f, x0, eps)
%NEWTON Newton's method for finding stationary points of f, starting from
%x0
    syms x1 x2

    df_sym = gradient(f, [x1,x2]);
    df = matlabFunction(df_sym,'Vars',[x1,x2]); 
    ddf_sym = hessian(f, [x1,x2]);
    ddf = matlabFunction(ddf_sym,'Vars',[x1,x2]);
    
    df_vector = @(x) df(x(1),x(2)); % Vector version of df
    ddf_vector = @(x) ddf(x(1),x(2)); % Vector version of ddf
        
    % counter in case of the method not converging
    counter = 0;
    
    % iterate until convergence
    while norm(df_vector(x0)) > eps && counter < 500
        u = -df_vector(x0);
        t0 = (u' * u)/(u' * ddf_vector(x0) * u);
        x0 = x0 + (t0 * u); % New point
        norm(df_vector(x0));
        counter = counter + 1;
    end
    
    x_star = x0;
end

