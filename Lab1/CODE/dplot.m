function dplot(t, x, p)
    distances = ones(size(p, 1),1);
    for i = 1:size(p,1)
        distances(i) = sqrt((x(i,1) - p(i,1))^2 + (x(i,2) - p(i,2))^2);
    end
    figure
    plot(t,distances)
    hold on
    scatter(t,distances,'filled')
    title('Distance ')
    xlabel('t');
    ylabel('dist')
    hold off
end

