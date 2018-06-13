function contents = saveScript( script )
contents = cell( 0, 3 );
for n = 1:length( script.Contents )
    block = script.Contents(n);
    if strcmp( block.Tag, 'placeholder' )
        continue
    end
    name = block.UserData{1};
    value = blockValue( block );
    contents{end+1,1} = name;
    contents{end,2} = value;
    if strcmp( name, 'Repeat' )
        contents{end,3} = saveScript( block.Contents(2) );
    end
end

end