function turtleForward( value, canvas )

begin = canvas.UserData.Position;
heading = canvas.UserData.Heading;
finish = begin + [sin(heading) cos(heading)*value];

if canvas.UserData.PenDown
    line( 'Parent', canvas, 'XData', [begin(1) finish(1)], ...
        'YData', [begin(2) finish(2)] )
end

canvas.UserData.Position = finish;

end