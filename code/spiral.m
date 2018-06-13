contents = { 'Clear', 0, [];
             'Repeat', 10, { 'Left', 5, []; 
                             'Repeat', 10, { 'Forward', 10, [];
                                             'Left', 14, [] };
                             'Repeat', 10, { 'Right', 5, [];
                                             'Repeat', 17, { 'Forward', 13, []; 
                                                             'Left', 3, [] } };
                                             'Back to center', 0, []; 
                                             'Right', 3, [];
                                             'Repeat', 11, { 'Pen up', 0, [];
                                                             'Forward', 29, [];
                                                             'Pen down', 0, [];
                                                             'Right', 4, [];
                                                             'Forward', -24, [] } };
             'Draw turtle', 0, [] };         
fid = fopen( 'examples/spiral.json', 'w' );
dispose = onCleanup( @() fclose( fid ) );
fprintf( fid, '%s\n', jsonencode( contents ) );
turtle('spiral.json')