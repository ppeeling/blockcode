function value = blockValue(block, value)
input = findobj( block, 'Style', 'edit', '-depth', 2 );
if nargin == 2
    input.String = value;
else
    value = str2double(input.String);
end
end