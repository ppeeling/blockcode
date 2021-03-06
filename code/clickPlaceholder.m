function clickPlaceholder(target,~)
assert( strcmp( target.Tag, 'placeholder' ) )
window = gcbf();

% An existing selected block
selectedStyle = Stylesheet.BlockSelected;
selectedBlock = findobj( window, selectedStyle{:} );
if isempty( selectedBlock )
    return
end

menu = findobj( window, 'Tag', 'menu' );
script = findobj( window, 'Tag', 'script' );

if ismember( selectedBlock, menu.Contents )
    % copy the block from the menu to the script
    inserted = menuCopy( selectedBlock, target.Parent );

elseif ismember( target, menu.Contents )
    % back onto menu, from script, so delete
    % remove the placeholder preceding the selected block
    idx = find( selectedBlock.Parent.Contents == selectedBlock );
    delete( selectedBlock.Parent.Contents(idx-1:idx) );  
    runScript( script )
    return
else
    % remove the placeholder preceding the selected block
    idx = find( selectedBlock.Parent.Contents == selectedBlock );
    delete( selectedBlock.Parent.Contents(idx-1) );
    % move the block by reparenting
    inserted = selectedBlock;
    inserted.Parent = target.Parent;
end

target.Parent.MinimumHeights(end) = 30;
if ~strcmp( inserted.Tag, 'Repeat' )
    target.Parent.Heights(end) = 30;
end
insertBefore( target.Parent, target, inserted );

placeholder = createPlaceholder( target.Parent );
insertBefore( target.Parent, inserted, placeholder );

% Resize the parent heights so content generally "fits"
parent = target.Parent;
while ~isa( parent.Parent, 'uix.HBox' )
    if isa( parent, 'uix.ScrollingPanel' ) % Update scrollbar height
        parent.MinimumHeights = sum( parent.Contents.MinimumHeights ) + length( parent.Contents.MinimumHeights ) * parent.Contents.Spacing;
    else
        idx = find( parent.Parent.Contents == parent );
        parent.Parent.MinimumHeights(idx) = parent.Parent.MinimumHeights(idx) + 30;
        parent.Parent.Heights(idx) = parent.Parent.Heights(idx) - 1;
    end
    parent = parent.Parent;
end
runScript( script )

end