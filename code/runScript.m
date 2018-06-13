function runScript( script, registry )

for n = 1:length( script.Contents )
    block = script.Contents(n);
    if ~strcmp( block.Tag, 'block' )
        continue
    end
    name = block.UserData{1};
    if strcmp( block.UserData{1}, 'Repeat' )
        R = blockValue( block ); % number of times to repeat
        for r = 1:R
            runScript( block.Contents(2), registry )
        end
    elseif isKey( registry, name )
        func = registry(name);
        feval( func, blockValue( block ) );
    else
end

end