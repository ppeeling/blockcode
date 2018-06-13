function insertBefore( vbox, this, insert )
% desired is the last of the contents
N = length( vbox.Contents );
this = find( vbox.Contents == this );
insert = find( vbox.Contents == insert );
perm = setdiff( 1:N, insert );
i = find( perm == this );
perm = [perm(1:i-1) insert perm(i:end)];
vbox.Contents = vbox.Contents(perm);
end