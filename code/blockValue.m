function value = blockValue(block)
input = findobj( block, 'Tag', 'value', '-depth', 2 );
if isempty( input )
    value = input;
else
    value = str2double(input.String);
end
end