function points = create_line(a1, a2, b1, b2, number_of_points)
%CREATE_LINE Create a line of evenly spread points between
%two end points.
    x = (linspace(a1, b1, number_of_points))';
    y = (linspace(a2, b2, number_of_points))';

    points = [x,y];
end

