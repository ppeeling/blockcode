function value = blockUnits(block)
input = findobj( block, 'Style', 'text', '-depth', 2 );
if isempty( input )
    value = input;
else
    value = input.String;
end
end