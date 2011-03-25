function ret = potencial(W, xi, params)
    
    input_i = xi.pattern';

    for i = 1:length(W),
        ret{i} = W{i} * input_i;
        input_i = params.g(ret{i});
        input_i(1) = -1;
    end

end