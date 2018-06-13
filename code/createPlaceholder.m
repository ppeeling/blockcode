function placeholder = createPlaceholder( parent )
placeholder = uix.VBox( 'Parent', parent, 'BackgroundColor', 'blue', ...
    'Tag', 'placeholder', 'ButtonDownFcn', @clickPlaceholder );
parent.Heights(end) = 10;
parent.MinimumHeights(end) = 10;
end