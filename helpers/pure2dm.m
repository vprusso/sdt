function M = pure2dm(x)
%PURE2DM The density matrix corresponding to the pure state x
%   M = PURE2DM(x) returns the rank-one projector corresponding to x.
    
    M = x*x';
end

