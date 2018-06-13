function mouseOver(window,evt)

% Highlight blocks in script
scriptBlocks = findobj( window, 'Tag', 'placeholder' );
style = Stylesheet.PlaceholderStyle;
set( scriptBlocks, style{:} )
target = evt.HitObject;
if ~any( scriptBlocks == target)
    return
end
style = Stylesheet.PlaceholderHoverOver;
set( target, style{:} );

end