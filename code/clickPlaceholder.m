function clickPlaceholder(target,~)
assert( strcmp( target.Tag, 'placeholder' ) )
window = gcbf();

% An existing selected block
selectedBlock = findobj( window, 'Tag', 'block', 'BackgroundColor', [1 0 0] );
if isempty( selectedBlock )
    return
end

menu = findobj( window, 'Tag', 'menu' );
if ismember( selectedBlock, menu.Contents )
    % copy the block from the menu to the script
    args = selectedBlock.UserData;
    inserted = createBlock( args{:} ); % I want to use copyobj!
    inserted.Parent = target.Parent;
    set( findobj( inserted ), 'ButtonDownFcn', @clickBlock );

    if strcmp( inserted.UserData{1}, 'Repeat' )
        % Further workaround because of copyobj not working
        rptContainer = uix.VBox( 'Parent', inserted,  'Spacing', 10, 'Padding', 10, 'BackgroundColor', [1 0.5 0] );
        inserted.MinimumHeights = [30 30];
        placeholder = copyobj( target, rptContainer );
        placeholder.ButtonDownFcn = @clickPlaceholder; % copyobj does not copy callbacks
        target.Parent.MinimumHeights(end) = 60;
    else
        target.Parent.MinimumHeights(end) = 30;
    end

else
    % remove the placeholder preceding the selected block
    idx = find( selectedBlock.Parent.Contents == selectedBlock );
    delete( selectedBlock.Parent.Contents(idx-1) );
    % move the block by reparenting
    inserted = selectedBlock;
    inserted.Parent = target.Parent;
end

insertBefore( target.Parent, target, inserted );

placeholder = copyobj( target, target.Parent );
target.Parent.MinimumHeights(end) = 10;
target.Parent.Heights(end) = 10;
placeholder.ButtonDownFcn = @clickPlaceholder; % copyobj does not copy callbacks
insertBefore( target.Parent, inserted, placeholder );

% Resize the parent heights so content generally "fits"
parent = target.Parent;
while isa( parent.Parent, 'uix.VBox' )
    idx = find( parent.Parent.Contents == parent );
    parent.Parent.MinimumHeights(idx) = parent.Parent.MinimumHeights(idx) + 30;
    parent.Parent.Heights(idx) = parent.Parent.Heights(idx) - 1;
    parent = parent.Parent;
end

end