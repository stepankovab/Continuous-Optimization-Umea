function plot_3(n_discs, xopt)
%PLOT_SQUARE Summary of this function goes here
%   Detailed explanation goes here

    radius = xopt(2 * n_discs + 1);
    xcoords = xopt(1,1:n_discs);
    ycoords = xopt(1, n_discs + 1: 2 * n_discs);
    radii = xopt(1, 2*n_discs + 1: 3*n_discs);

    figure
    area = density_3(xopt);

    title(area)
    subtitle(n_discs)
    % Centre points
    hold on;
    xlim([0,1]);
    ylim([0,1]);


    
    % Draw cicles
    numpoints = 64; % how many points in a circle

    % for task 3
    theta=linspace(0,2*pi,numpoints);
    rho=ones(1,numpoints) * 1/4;
    [circX,circY] = pol2cart(theta,rho);
    circX=circX+1;
    circY=circY+1;
    plot(circX,circY,'b-', Color='red');

    theta=linspace(0,2*pi,numpoints);
    rho=ones(1,numpoints) * 1/4;
    [circX,circY] = pol2cart(theta,rho);
    circX=circX+2/3;
    circY=circY+1/4;
    plot(circX,circY,'b-', Color='red');


    plot(linspace(0, 1/3,30), linspace(2/3, 1, 30), LineStyle="-", Color='red')


    for i = 1:n_discs
        % from some code on drawing circles
        theta=linspace(0,2*pi,numpoints);
        rho=ones(1,numpoints)*radii(i);
        [circX,circY] = pol2cart(theta,rho);
        circX=circX+xcoords(i);
        circY=circY+ycoords(i);
        plot(circX,circY,'b-');
    end
    hold off;
end




