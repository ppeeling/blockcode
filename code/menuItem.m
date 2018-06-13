function item = menuItem( menu, registry, name, fn, value, units )
item = createBlock( name, value, units );
set( item, 'Parent', menu, 'UserData', {name,value,units} );
registry(name) = fn; %#ok<NASGU>
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
end