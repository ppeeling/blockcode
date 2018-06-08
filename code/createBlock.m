function block = createBlock(name,value,units)
block = uix.VBox( 'Tag', 'block', 'Padding', 5, 'BackgroundColor', 'blue' );
container = uix.HBox( 'Parent', block, 'Tag', name );
uix.Text( 'Parent', container, 'String', name, 'VerticalAlignment', 'middle' );
uicontrol( 'Parent', container, 'Style', 'edit', 'String', value, 'Tag', 'value' );
uix.Text( 'Parent', container, 'String', units, 'VerticalAlignment', 'middle', 'Tag', 'units' );
set( block, 'UserData', { name, value, units } );
end