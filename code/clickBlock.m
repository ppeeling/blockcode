function clickBlock(target,~)

while( isempty( target.Tag ) ) % locate ancestor block
    target = target.Parent;
end

window = gcbf();

% An existing selected block
selectedBlock = findobj( window, 'BackgroundColor', [1 0 0] );

if ~isempty( selectedBlock )
    % target was already selected
    selectedBlock.BackgroundColor = 'blue';
end

placeholders = findobj( window, 'Tag', 'placeholder' );
set( placeholders, 'BackgroundColor', 'blue' )

target.BackgroundColor = 'red';
set( window, 'WindowButtonMotionFcn', @mouseOver )

end
