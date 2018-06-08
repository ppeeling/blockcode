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
menuItem( menu, 'Repeat', [], 10, 'times' );
uix.Empty( 'Parent', menu, 'BackgroundColor', 'blue' );
menu.Heights( 1:length( menu.Heights )-1 ) = 40;

p = createBlock( 'Repeat', 1, 'times' ); p.Parent = script;
q = createBlock( 'Left', 1, 'degrees' ); q.Parent = p;
uix.Empty( 'Parent', script, 'BackgroundColor', 'blue' );
script.Heights( 1:length( script.Heights )-1 ) = 80;

end