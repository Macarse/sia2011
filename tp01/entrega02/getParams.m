function params = getParams()
    params.beta = 0.5;
    params.g = inline(sprintf('tanh(%f*x)', params.beta));
    params.g_diff = inline(sprintf('(%f) * (1 - %s.^2)', params.beta, formula(params.g)));
    params.eta = 2.5;

    params.MAX_WEIGHT = 0.5;
    params.MIN_WEIGHT = -0.5;

    params.INPUTS_QTY = 4;
    params.hidden = [3,2,1];
    params.OUTPUTS_QTY = 1;

    params.N_EPOCHS = 15000;
    params.tolerancia = 10^(-1);

end
