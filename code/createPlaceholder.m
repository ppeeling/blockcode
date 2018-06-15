function placeholder = createPlaceholder( parent )
style = Stylesheet.PlaceholderStyle;
placeholder = uix.VBox( 'Parent', parent, style{:}, ...
    'Tag', 'placeholder', 'ButtonDownFcn', @clickPlaceholder );
parent.Heights(end) = parent.Padding;
parent.MinimumHeights(end) = parent.Padding;
end