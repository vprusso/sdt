function [v, M] = PPTDist(X, p, SYS, DIM)
% PPTDIST
%
%   author: Alessandro Cosentino <cosenal@gmail.com>
%   Copyright (c) Alessandro Cosentino, 2015
    [S,N,d] = check_ensemble(X, p);

    cvx_begin sdp quiet
        cvx_precision default
        
        variable P(d,d,N) hermitian;

        opt = 0;
        P_sum = zeros(d);
        
        for k=1:N
            opt = opt + ip(P(:,:,k), S{k});
            P_sum = P_sum + P(:,:,k);

        end 
                
        maximize(opt);
        subject to
            P_sum == eye(d);
            P >= 0;
    cvx_end
    
    v = cvx_optval;
    
    % Also return the optimal measurements, if requested.

    if(nargout > 1)
        M = mat2cell(reshape(P,d,d*N),d,d*ones(1,N));
    end
end