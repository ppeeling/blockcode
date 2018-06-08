function units = blockUnits(block)
input = findobj( block, 'Tag', 'units' );
if isempty( input )
    units = input;
else
    units = input.String;
end
end