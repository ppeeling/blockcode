function dragMove(window,evt,target,originalPoint)

newPoint = get( window, 'CurrentPoint' );
delta = newPoint - originalPoint;
set(target,'Position',get(target,'Position') + [delta(1:2) 0 0])

% Highlight blocks in script
script = findobj( window, 'Tag', 'script' );
scriptBlocks = script.Contents;
blockPositions = reshape([scriptBlocks.Position],4,[])';
blockPositions(:,1) = blockPositions(:,1) + script.Position(1); % Relative positioning hack
over = isPointInPosition( newPoint, blockPositions );
set( scriptBlocks(over), 'BackgroundColor', 'green' )
set( scriptBlocks(~over), 'BackgroundColor', 'blue' )

set( window, 'WindowButtonMotionFcn', {@dragMove,target,newPoint}, ...
    'WindowButtonUpFcn', {@dragDrop,target,newPoint})

end