function params = getParams()
    params.beta = 0.5;
    params.g = inline(sprintf('tanh(%f*x)', params.beta));
    params.g_diff = inline(sprintf('(%f) * (1 - %s.^2)', params.beta, formula(params.g)));
    params.eta = 2.5;
    params.N = 2;
    params.N_EPOCHS = 15000;
end
