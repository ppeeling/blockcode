function block = createBlock(name,value,units)
block = uix.VBox( 'Tag', name, 'Padding', 5, 'BackgroundColor', 'blue' );
container = uix.HBox( 'Parent', block );
uix.Text( 'Parent', container, 'String', name, 'VerticalAlignment', 'middle' );
uicontrol( 'Parent', container, 'Style', 'edit', 'String', value, 'Tag', 'value', 'Callback', @onEditValue );
uix.Text( 'Parent', container, 'String', units, 'VerticalAlignment', 'middle', 'Tag', 'units' );
block.MinimumHeights = 30;
end