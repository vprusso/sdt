function dm = pure2dm(x)
%PURE2DM The density matrix corresponding to the pure state x
%   dm = PURE2DM(x) returns the rank-one projector corresponding to x.
    
    dm = x*x';
end

