function v = ip(A,B)
% IP  Calculate the inner product of two linear operators
%   v = IP(A,B) return the inner product of A and B, i.e., <A,B>.
%
%   author: Alessandro Cosentino <cosenal@gmail.com>
%   Copyright (c) Alessandro Cosentino, 2015

    if (nargin < 2)
        error('SDT:ip', 'Too few input arguments.')
    elseif (nargin == 2)
        v = trace(A'*B);
    end
end
