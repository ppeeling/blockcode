function turtle

f = figure( 'Toolbar', 'none', 'Menu', 'none', 'Name', 'turtle' );
hbox = uix.HBoxFlex( 'Parent', f, 'Spacing', 5 );
menu = uix.VBox( 'Parent', hbox, 'Tag', 'menu', 'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
script = uix.VBox( 'Parent', hbox, 'Tag', 'script', 'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
canvas = axes( 'Parent', hbox, 'Tag', 'canvas' );
grid( canvas, 'on' );
hbox.Widths = [-1 -1 -2];

% Not part of turtle
registry = containers.Map( 'KeyType', 'char', 'ValueType', 'any' );

% For deleting blocks
uix.VBox( 'BackgroundColor', 'blue', 'Tag', 'placeholder', 'Parent', menu, ...
    'ButtonDownFcn', @clickPlaceholder);

rpt = menuItem( menu, registry, 'Repeat', [], 10, 'times' );
rptContainer = uix.VBox( 'Parent', rpt,  'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
set( rpt, 'Heights', [-1 30], 'MinimumHeights', [30 30] );
uix.VBox( 'BackgroundColor', 'blue', 'Tag', 'placeholder', 'Parent', rptContainer );

% Turtle
menuItem( menu, registry, 'Left', @(value)turtleRotate(-value,canvas), 5, 'degrees' );
menuItem( menu, registry, 'Right', @(value)turtleRotate(value,canvas), 5, 'degrees' );
menuItem( menu, registry, 'Forward', @(value)turtleForward(value,canvas), 10, 'steps' );
menuItem( menu, registry, 'Back', @(value)turtleForward(-value,canvas), 10, 'steps' );
menuItem( menu, registry, 'Pen up', @(value)turtlePen(false,canvas), 0, '' );
menuItem( menu, registry, 'Pen down', @(value)turtlePen(true,canvas), 0, '' );
menuItem( menu, registry, 'Back to center', @(value)turtlePosition([0 0],canvas), 0, '' );

menuItem( script, registry, 'Init', @(value)turtleInit(canvas), 0, '' );
uix.VBox( 'Parent', script, 'BackgroundColor', 'blue', 'Tag', 'placeholder', 'ButtonDownFcn', @clickPlaceholder );
menuItem( script, registry, 'Draw turtle', @(value)turtleDraw(canvas), 0, '' );
script.MinimumHeights = [30 10 30];

runScript( script )

end