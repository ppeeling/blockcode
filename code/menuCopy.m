function item = menuCopy( menuItem, parent )
args = menuItem.UserData;
args{2} = blockValue( menuItem );
item = createBlock( args{1:3} );
set( item, 'Parent', parent, 'UserData', args );
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
if strcmp( args{1}, 'Repeat' )
    container = uix.VBox( 'Parent', item,  'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
    set( item, 'Heights', [30 -1], 'MinimumHeights', [30 30] );
    createPlaceholder( container );
    parent.MinimumHeights(end) = 60;
else
    parent.MinimumHeights(end) = 30;
end

end