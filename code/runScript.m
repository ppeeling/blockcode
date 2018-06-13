function runScript( script )

for n = 1:length( script.Contents )
    block = script.Contents(n);
    if ~strcmp( block.Tag, 'block' )
        continue
    end
    func = block.UserData{4};
    if ~isempty( func )
        feval( func, blockValue( block ) );
    elseif strcmp( block.UserData{1}, 'Repeat' )
        R = blockValue( block ); % number of times to repeat
        for r = 1:R
            runScript( block.Contents(2) )
        end
    end
end

end