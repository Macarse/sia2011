
function y = main()

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
    epoch = 1;

    while (error > tole && epoch < params.N_EPOCHS)
        perm = randperm(length(inputs));
        inputs = inputs(perm);
        S = S(perm);
        O = zeros(1,length(S));
        for xi_index = 1:length(inputs),
            xi = inputs(xi_index);                       % tomo una entrada al azar del conjunto de entradas
            h = potencial(W, xi, params);                        % calculo el potencial para esa entrada

            O(xi_index) = params.g(h{length(W)});                          % calculo la salida para ese potencial
            Si = xi.output;                            % obtengo la salida real para esta entrada
            delta_mini = delta(Si, O(xi_index), h, params.g_diff, W);          % calculo las correcciones
            delta_w = calc_delta_w(delta_mini, params.eta, h, params.g);
            W = W + delta_w;                             % corrijo
        end
        error = calc_error(S, O);                       % calculo el error
        epoch = epoch + 1;
    end

    printf("params:\n");
    params
    printf("error: %f. Epochs: %d\n\n", error, epoch);

    printf("Truth Table Learned:\n\n");
    printf("Input   \t Oi \t\t Si \t\t (Oi-Si)^2\n");
    printf("------------------------------------------------------------\n");
    for i = inputs
        Oi = params.g(W*i.pattern');
        Si = i.output;
        diff = abs(Oi-Si)^2;
        for v = i.pattern
            if (v)
                c = 1;
            else 
                c = 0;
            endif
            printf("%c",c+"0");
        end
        printf("\t\t%f\t%f\t%f\n", Oi,Si, diff);   
    end 

    y = W;


end
