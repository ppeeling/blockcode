function insertBefore( vbox, this, next, height )

N = length( vbox.Contents );
idx = find( vbox.Contents == this );
perm = [1:(idx-1) N idx:(N-1)];
vbox.Contents = vbox.Contents(perm);

end