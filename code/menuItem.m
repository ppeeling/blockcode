function item = menuItem( menu, name, fn, value, units )
item = createBlock( name, value, units );
set( item, 'Parent', menu, 'UserData', fn );
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
end