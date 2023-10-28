function plot_square(n_discs, xopt)
%PLOT_SQUARE Summary of this function goes here
%   Detailed explanation goes here

    radius = xopt(2 * n_discs + 1);
    xcoords = xopt(1,1:n_discs);
    ycoords = xopt(1, n_discs + 1: 2 * n_discs);

    figure
    area = (4 / pi) * (n_discs * radius^2 * pi);

    title(area)
    % Centre points
    hold on;
    xlim([0,1]);
    ylim([0,1]);



    
    % Draw cicles
    numpoints = 64; % how many points in a circle


    theta=linspace(0,2*pi,numpoints);
    rho=ones(1,numpoints);
    [circX,circY] = pol2cart(theta,rho);
    circX=circX+0;
    circY=circY+0;
    plot(circX,circY,'b-');


    for i = 1:n_discs
        % from some code on drawing circles
        theta=linspace(0,2*pi,numpoints);
        rho=ones(1,numpoints)*radius;
        [circX,circY] = pol2cart(theta,rho);
        circX=circX+xcoords(i);
        circY=circY+ycoords(i);
        plot(circX,circY,'b-');
    end
    hold off;
end

