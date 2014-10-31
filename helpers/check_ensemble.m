function [S,N,d] = check_ensemble(X, p)
% CHECK_ENSEMBLE 

    if(iscell(X))
        N = length(X);
        d = length(X{1});
        S = X;
    else
        [d,N] = size(X);
        S = mat2cell(X, d, ones(1, N));
        S = cellfun(@pure2dm, S, 'UniformOutput', false);
    end
    
    if(length(p) ~= N)
        error('Length of set of states and probability vector don''t match');
    else
        for k=1:N
            S{k} = S{k}*p(k);    
        end
    end
end
