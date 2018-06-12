function item = menuItem( menu, name, fn, value, units )
item = createBlock( name, value, units );
% scriptRegistry[name] = fn;
set( item, 'Parent', menu );
set( findobj( item ), 'ButtonDownFcn', @clickBlock );
end