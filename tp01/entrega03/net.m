function ret = net(inputs, W, params)
    ret = zeros(1,length(inputs));

    for xi_index = 1:length(inputs),
        xi.pattern = [-1 inputs(xi_index)];
        h = potencial(W, xi, params);
        ret(xi_index) = params.m * h{length(W)};
        
    end
end
