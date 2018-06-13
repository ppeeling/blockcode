function onEditValue(src,evt)
src.Parent.Parent.UserData{2} = src.String;
runScript( findobj( gcbf, 'Tag', 'script' ) )
end