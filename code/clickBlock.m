function clickBlock(target,~)

while( isempty( target.Tag ) ) % locate ancestor block
    target = target.Parent;
end

window = gcbf();

selectedStyle = Stylesheet.BlockSelected;
blockStyle = Stylesheet.Block;

% An existing selected block
selectedBlock = findobj( window, selectedStyle{:} );

if ~isempty( selectedBlock )
    % target was already selected
    set( selectedBlock, blockStyle{:} );    
end

placeholders = findobj( window, 'Tag', 'placeholder' );
set( placeholders, blockStyle{:} )
set( target, selectedStyle{:} )

set( window, 'WindowButtonMotionFcn', @mouseOver )

end
