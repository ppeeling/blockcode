function loadScript( menu, script, contents )
contents = reshape( contents, [], 3 );
delete( script.Contents );
for n = 1:size( contents, 1 )
    name = contents{n,1};
    value = contents{n,2};
    createPlaceholder( script );
    block = menuCopy( findobj( menu, 'Tag', name ), script );    
    blockValue( block, value ); % set Block Value
    if strcmp( name, 'Repeat' )
        inner = contents{n,3};
        script.Heights(end) = -1;
        loadScript( menu, blockContents(block), inner );
    else
        script.Heights(end) = 30;
    end
end
createPlaceholder( script );
% Update scrollbar height
script.Parent.MinimumHeights = sum( script.MinimumHeights ) + length( script.MinimumHeights ) * 10;

end