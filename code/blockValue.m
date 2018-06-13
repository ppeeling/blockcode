function value = blockValue(block)
input = findobj( block, 'Style', 'edit', '-depth', 2 );
value = str2double(input.String);
end