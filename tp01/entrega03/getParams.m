function params = getParams()
    params.beta = 1;
    
    % tanh
    %params.g = inline(sprintf('tanh(%f*x)', params.beta));
    %params.g_diff = inline(sprintf('(%f) * (1 - %s.^2)', params.beta, formula(params.g)));
    
    % exp
    params.g = inline(sprintf('1./(1+exp(%f.*x))',-2*params.beta));
    params.g_diff = inline(sprintf('2*%f.*(%s).*(1-%s)', params.beta, formula(params.g), formula(params.g)));
    

    params.m = 1;
    params.repeat = 0; % set to 0 to deactivate pattern repetition
    params.step = 0.03;

    params.MAX_WEIGHT = 0.5;
    params.MIN_WEIGHT = -0.5;

    params.INPUTS_QTY = 1;
    params.hidden = [13,13];
    params.OUTPUTS_QTY = 1;

    params.N_EPOCHS = 5000;
    params.tolerancia = 0.5;

    % set to 0.0 to use no gradient padding improvement
    params.gradient_padding = 0.01;

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
    params.momentum_alpha = 0.1;

end
