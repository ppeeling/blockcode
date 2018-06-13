function item = menuItem( menu, registry, name, fn, value, units )
item = createBlock( name, value, units );
set( item, 'Parent', menu, 'UserData', {name,value,units,fn} );
registry(name) = fn;
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
end