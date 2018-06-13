function value = blockValue(block)
input = findobj( block, 'Style', 'edit', '-depth', 2 );
if isempty( input )
    value = input;
else
    value = str2double(input.String);
end
end