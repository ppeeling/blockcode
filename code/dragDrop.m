function dragDrop(window,evt,target,originalPoint)
newPoint = get( window, 'CurrentPoint' );

script = findobj( window, 'Tag', 'script' );
scriptBlocks = script.Contents;
set( scriptBlocks, 'BackgroundColor', 'blue' ); % remove any highlighting from drag-over

scriptPosition = get( script, 'Position' );
if isPointInPosition( newPoint, scriptPosition )
    
    blockPositions = vertcat(scriptBlocks.Position);
    blockPositions(:,1) = blockPositions(:,1) + script.Position(1); % relative pos hack
    insertAt = find( isPointInPosition( newPoint, blockPositions ) );
    % inserted = copyobj( target, script ); % BUG - children of target not copied
    args = target.UserData;
    inserted = createBlock(args{:});
    inserted.Parent = script;
    script.Contents([end-1 end]) = script.Contents([end end-1]);
    script.Heights(end-1) = 40;
    if isa( scriptBlocks( insertAt ), 'uix.VBox' ) && ...
            strcmp( scriptBlocks( insertAt ).Contents(1).Tag, 'Repeat' )
        inserted.Parent = scriptBlocks( insertAt );
        script.Heights(insertAt) = script.Heights(insertAt) + 40;
    else
        script.Contents(1:end-1) = [script.Contents(1:insertAt-1);
            script.Contents(end-1);script.Contents(insertAt:end-2)];
    end
end

delete( target )

set( window, 'WindowButtonMotionFcn', [], ...
    'WindowButtonUpFcn', [])
end