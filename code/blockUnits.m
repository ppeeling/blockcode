function value = blockUnits(block)
input = findobj( block, 'Style', 'text', '-depth', 2 );
value = input.String;
end