function [v, M] = GlobalDist(X, p)
% GLOBALDIST
%
%   author: Alessandro Cosentino <cosenal@gmail.com>
%   Copyright (c) Alessandro Cosentino, 2015

    cvx_begin sdp
        cvx_precision default
    
        variable P(ssize,ssize,N) hermitian;

        opt = 0;
        P_sum = zeros(dim);
        
        for k=1:N
            opt = opt + ip(P(:,:,k), S{k});
            P_sum = P_sum + P(:,:,k);
        end 
        
        maximize(opt);
        subject to
            P >= 0;
    cvx_end
    
    v = cvx_optval/N;
    
    % Also return the optimal measurements, if requested.

    if(nargout > 1)
        M = mat2cell(reshape(P,dim,dim*num_ops),dim,dim*ones(1,num_ops));
    end
end