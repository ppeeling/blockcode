function turtleInit( canvas )
cla( canvas )
canvas.UserData = struct( 'Position', [0 0], 'Heading', 0, 'PenDown', true );
end