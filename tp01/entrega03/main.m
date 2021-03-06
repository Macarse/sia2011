
function y = main()
    xs = [0:0.01:4];
    ys = func(xs);

    errors = [];
    params = getParams();

    random_seed = 1337;
    rand('state', random_seed);
    randn('state', random_seed);
    
    W = init_weights(params);
    inputs = get_inputs(params);

    S = zeros(length(inputs));
    for i = 1:length(inputs),
        S(i) = inputs(i).output;
    end

    tole = params.tolerancia;

    error = tole + 1;
    epoch = 0;
    while (error > tole && epoch < params.N_EPOCHS)
        perm = randperm(length(inputs));
        inputs = inputs(perm);
        S = S(perm);
        O = zeros(1,length(S));
        for xi_index = 1:length(inputs),
            xi = inputs(xi_index);                       % tomo una entrada al azar del conjunto de entradas
            h = potencial(W, xi, params);                        % calculo el potencial para esa entrada
            O(xi_index) =  params.m * h{length(W)};   % antes era params.g(h{length(W)});
                        % ^^^ calculo la salida para ese potencial
            Si = xi.output;                            % obtengo la salida real para esta entrada
            delta_mini = delta(Si, O(xi_index), h, params.g_diff, W, params);          % calculo las correcciones
            delta_w = calc_delta_w(delta_mini, params.eta, h, params.g, xi.pattern);
            % corrijo
            if ( exist ("old_delta_w", "var"))
                delta_w = apply_momentum(old_delta_w, delta_w, params);
            endif
            old_delta_w = delta_w;
            W = apply_deltas(W, delta_w);
        end
        for xi_index = 1:length(inputs),
            xi = inputs(xi_index);
            h = potencial(W, xi, params);
            O(xi_index) = params.g(h{length(W)});
        end
        error = calc_error(S, O);                       % calculo el error
        epoch = epoch + 1;
        errors(epoch) = error;

        if ( params.use_adaptive_eta )
            params.eta = updateLearningRate(errors, epoch, params);
        endif

        if ( mod(epoch,10) == 0 )
            printf("%d\t%f\n", epoch, error);
	    %if (!(error > tole && epoch < params.N_EPOCHS))
            more off;
            hold off;
            plot(xs, ys, "r");
            hold on;
            plot(xs, net(xs, W, params), "b");
            drawnow;
	    %endif
        endif

    end

    printf("params:\n");
    params
    printf("error: %f. Epochs: %d\n\n", error, epoch);

    printf("Truth Table Learned:\n\n");
    printf("Input   \t Oi \t\t Si \t\t (Oi-Si)^2\n");
    printf("------------------------------------------------------------\n");
    for i = inputs
        h = potencial(W, i, params);
        Oi = params.g(h{length(W)});
        Si = i.output;
        diff = abs(Oi-Si)^2;
        for v = i.pattern
            if (v==1)
                c = 1;
            else 
                c = 0;
            endif
            printf("%c",c+"0");
        end
        printf("\t\t%f\t%f\t%f\n", Oi,Si, diff);   
    end 

    y = W;
    plot(errors);


end
