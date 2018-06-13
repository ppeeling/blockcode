function saveScriptToFile(~,~,script)
contents = saveScript( script );
[f,p] = uiputfile( '*.json' );
if isequal( f, 0 )
    return
end
fid = fopen( fullfile( p, f ), 'w' );
dispose = onCleanup( @() fclose( fid ) );
fprintf( fid, '%s\n', jsonencode( contents ) );
end