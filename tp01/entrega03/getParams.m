function params = getParams()
    params.beta = 1;
    params.g = inline(sprintf('tanh(%f*x)', params.beta));
    params.g_diff = inline(sprintf('(%f) * (1 - %s.^2)', params.beta, formula(params.g)));
    params.eta = 0.02;

    params.MAX_WEIGHT = 0.5;
    params.MIN_WEIGHT = -0.5;

    params.INPUTS_QTY = 1;
    params.hidden = [15,13];
    params.OUTPUTS_QTY = 1;

    params.N_EPOCHS = 20000;
    params.tolerancia = 10^(-2);

    % set to 0.0 to use no gradient padding improvement
    params.gradient_padding = 0.10;

end
