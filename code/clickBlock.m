function clickBlock(target,~)

while( ~strcmp( target.Tag, 'block' ) ) % locate ancestor block
    target = target.Parent;
end

window = gcbf();

% An existing selected block
selectedBlock = findobj( window, 'Tag', 'block', 'BackgroundColor', [1 0 0] );

if ~isempty( selectedBlock )
    % target was already selected
    selectedBlock.BackgroundColor = 'blue';
end

placeholders = findobj( window, 'Tag', 'placeholder' );
set( placeholders, 'BackgroundColor', 'blue' )

target.BackgroundColor = 'red';
set( window, 'WindowButtonMotionFcn', @mouseOver )

end
