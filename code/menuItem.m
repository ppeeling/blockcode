function item = menuItem( menu, name, fn, value, units )
item = createBlock( name, value, units );
set( item, 'Parent', menu, 'UserData', {name,value,units,fn} );
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
end