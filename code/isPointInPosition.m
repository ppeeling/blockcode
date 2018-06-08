function tf = isPointInPosition( point, position )
tf = all( point >= position(:,[1 2]) & point <= position(:,[1 2])+position(:,[3 4]), 2 );
end