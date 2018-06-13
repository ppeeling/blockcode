function loadScriptFromFile(~,~,menu,script)
[f,p] = uigetfile( '*.json' );
if isequal( f, 0 )
    return
end
contents = jsondecode(fileread(fullfile(p,f)));
loadScript( menu, script, contents );
runScript( script )
end