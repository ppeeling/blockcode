function loadScript( menu, script, contents )
contents = reshape( contents, [], 3 );
delete( script.Contents );
for n = 1:size( contents, 1 )
    name = contents{n,1};
    value = contents{n,2};
    createPlaceholder( script );
    block = menuCopy( findobj( menu, 'Tag', name ), script );
    
    block.Contents(1).Contents(2).String = value;
    if strcmp( name, 'Repeat' )
        inner = contents{n,3};
        script.Heights(end) = -1;
        loadScript( menu, block.Contents(2), inner );
    else
        script.Heights(end) = 30;
    end
end
createPlaceholder( script );

end