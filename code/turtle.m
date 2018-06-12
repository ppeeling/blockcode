function turtle

f = figure( 'Toolbar', 'none', 'Menu', 'none', 'Name', 'turtle' );
hbox = uix.HBoxFlex( 'Parent', f, 'Spacing', 5 );
menu = uix.VBox( 'Parent', hbox, 'Tag', 'menu', 'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
script = uix.VBox( 'Parent', hbox, 'Tag', 'script', 'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
canvas = axes( 'Parent', hbox, 'Tag', 'canvas' );
hbox.Widths = [-1 -1 -2];

menuItem( menu, 'Left', [], 5, 'degrees' );
menuItem( menu, 'Right', [], 5, 'degrees' );
menuItem( menu, 'Forward', [], 10, 'steps' );
menuItem( menu, 'Back', [], 10, 'steps' );

rpt = menuItem( menu, 'Repeat', [], 10, 'times' );
rptContainer = uix.VBox( 'Parent', rpt,  'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
set( rpt, 'Heights', [-1 30], 'MinimumHeights', [30 30] );
uix.VBox( 'BackgroundColor', 'blue', 'Tag', 'placeholder', 'Parent', rptContainer );

uix.VBox( 'Parent', script, 'BackgroundColor', 'blue', 'Tag', 'placeholder', 'ButtonDownFcn', @clickPlaceholder );
script.MinimumHeights = 10;

end