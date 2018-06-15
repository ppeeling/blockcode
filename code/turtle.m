function turtle( filename )

if nargin < 1
    filename = 'examples/init.json';
end

window = figure( 'Toolbar', 'none', 'Menu', 'none', 'Name', 'turtle' );
hbox = uix.HBoxFlex( 'Parent', window, 'Spacing', 5 );
menu = uix.VBox( 'Parent', hbox, 'Tag', 'menu', 'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
scroll = uix.ScrollingPanel( 'Parent', hbox, 'Tag', 'scroll' );
script = uix.VBox( 'Parent', scroll, 'Tag', 'script', 'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
canvas = axes( 'Parent', hbox, 'Tag', 'canvas' );
grid( canvas, 'on' );
hbox.Widths = [-1 -1 -2];

bbox = uix.HButtonBox( 'Parent', menu );
uicontrol( 'Parent', bbox, 'String', 'Load', 'Callback', {@loadScriptFromFile,menu,script} )
uicontrol( 'Parent', bbox, 'String', 'Save', 'Callback', {@saveScriptToFile,script} )

createPlaceholder( menu ); % For deleting blocks
menuCopy( menuItem( [], 'Repeat', [], 10, 'times' ), menu );

% Turtle
menuItem( menu, 'Left', @(value)turtleRotate(-value,canvas), 5, 'degrees' );
menuItem( menu, 'Right', @(value)turtleRotate(value,canvas), 5, 'degrees' );
menuItem( menu, 'Forward', @(value)turtleForward(value,canvas), 10, 'steps' );
menuItem( menu, 'Back', @(value)turtleForward(-value,canvas), 10, 'steps' );
menuItem( menu, 'Pen up', @(value)turtlePen(false,canvas), 0, '' );
menuItem( menu, 'Pen down', @(value)turtlePen(true,canvas), 0, '' );
menuItem( menu, 'Back to center', @(value)turtlePosition([0 0],canvas), 0, '' );
menuItem( menu, 'Clear', @(value)turtleInit(canvas), 0, '' );
menuItem( menu, 'Draw turtle', @(value)turtleDraw(canvas), 0, '' );

contents = jsondecode(fileread(filename));
loadScript( menu, script, contents );
runScript( script )

end