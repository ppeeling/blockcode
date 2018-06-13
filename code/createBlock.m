function block = createBlock(name,value,units)
blockStyle = Stylesheet.Block;
block = uix.VBox( 'Tag', name, 'Padding', 5, blockStyle{:} );
container = uix.HBox( 'Parent', block );
uix.Text( 'Parent', container, 'String', name, 'VerticalAlignment', 'middle' );
uicontrol( 'Parent', container, 'Style', 'edit', 'String', value, 'Callback', @onEditValue );
uicontrol( 'Parent', container, 'String', units, 'Style', 'text' );
block.MinimumHeights = 30;
end