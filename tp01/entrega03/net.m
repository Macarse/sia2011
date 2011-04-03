function ret = net(inputs, W, params)
    ret = zeros(1,length(inputs));

    for xi_index = 1:length(inputs),
        xi.pattern = [-1 inputs(xi_index)];
        xi.output = 1;
        h = potencial(W, xi, params);
        ret(xi_index) = params.g(h{length(W)});
    end
end
