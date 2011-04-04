function params = getParams()
    params.beta = 1;
    params.g = inline(sprintf('tanh(%f*x)', params.beta));
    params.g_diff = inline(sprintf('(%f) * (1 - %s.^2)', params.beta, formula(params.g)));

    params.MAX_WEIGHT = 0.5;
    params.MIN_WEIGHT = -0.5;

    params.INPUTS_QTY = 1;
    params.hidden = [15,15];
    params.OUTPUTS_QTY = 1;

    params.N_EPOCHS = 20000;
    params.tolerancia = 10^(-2);

    % set to 0.0 to use no gradient padding improvement
    params.gradient_padding = 0.10;

    % -- ADAPTATIVE ETA --
    params.eta = 0.02;
    params.use_adaptive_eta = true;
    params.adaptive_eta_a = 0.01;
    params.adaptive_eta_b = 0.05;
    params.adaptive_eta_steps = 3;
    params.adaptive_eta_increment = 0.000001;
    params.adaptive_eta_decrement = 0.000001;
    params.adaptive_eta_last_decremented = 1;

    % -- momentum --
    % set to 0.0 to use no momentum
    params.momentum_alpha = 0.5;

end
