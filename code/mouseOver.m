function mouseOver(window,evt)

% Highlight blocks in script
scriptBlocks = findobj( window, 'Tag', 'placeholder' );
set( scriptBlocks, 'BackgroundColor', 'blue' )
target = evt.HitObject;
if ~any( scriptBlocks == target)
    return
end
set( target, 'BackgroundColor', 'green' );

end