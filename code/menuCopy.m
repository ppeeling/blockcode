function item = menuCopy( menuItem, parent )
item = createBlock( menuItem.Tag, blockValue(menuItem), blockUnits(menuItem) );
set( item, 'Parent', parent, 'UserData', menuItem.UserData );
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
if strcmp( item.Tag, 'Repeat' )
    scroll = uix.ScrollingPanel( 'Parent', item );
    container = uix.VBox( 'Parent', scroll,  'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
    set( item, 'Heights', [30 -1], 'MinimumHeights', [30 30] );
    createPlaceholder( container );
    scroll.MinimumHeights = 60;
    parent.MinimumHeights(end) = 60;
else
    parent.MinimumHeights(end) = 30;
end

end