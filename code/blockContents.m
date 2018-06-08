function contents = blockContents(block)
container = findobj( block, 'Tag', 'container', '-depth', 1 );
if isempty( container )
    contents = container;
else
    contents = container.Children;
end
end