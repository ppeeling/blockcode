function dragStart(target,~)
while( ~strcmp( target.Tag, 'block' ) ) % locate ancestor block
    target = target.Parent;
end
window = ancestor( target, 'figure' );
originalPosition = get( window, 'CurrentPoint' );
dragged = copyobj( target, window );
set( window, 'WindowButtonMotionFcn', {@dragMove,dragged,originalPosition}, ...
    'WindowButtonUpFcn', {@dragDrop,dragged,originalPosition})

end
