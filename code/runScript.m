function runScript( script )

for n = 1:length( script.Contents )
    block = script.Contents(n);
    if strcmp( block.Tag, 'placeholder' )
        continue
    end
    func = block.UserData;
    if ~isempty( func )        
        feval( func, blockValue( block ) );
    elseif strcmp( block.Tag, 'Repeat' )        
        R = blockValue( block ); % number of times to repeat
        for r = 1:R
            runScript( blockContents(block) )
        end
    end
end

end