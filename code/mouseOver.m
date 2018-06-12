function mouseOver(window,evt)

% Highlight blocks in script
script = findobj( window, 'Tag', 'script' );
target = evt.HitObject;
if ~any( findobj( script.Contents ) == target)
    return
end
scriptBlocks = findobj( script.Contents, 'Tag', 'placeholder' );
set( scriptBlocks, 'BackgroundColor', 'blue' )
if strcmp( target.Tag, 'placeholder' )
    set( target, 'BackgroundColor', 'green' );
end

end