function placeholder = createPlaceholder( parent )
style = Stylesheet.PlaceholderStyle;
placeholder = uix.VBox( 'Parent', parent, style{:}, ...
    'Tag', 'placeholder', 'ButtonDownFcn', @clickPlaceholder );
parent.Heights(end) = 10;
parent.MinimumHeights(end) = 10;
end