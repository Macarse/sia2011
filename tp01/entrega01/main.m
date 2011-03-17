function y = main()

    

    eta = 2.5;
    N = 5;
    random_seed = 1337;
    N_EPOCHS = 15000;
    rand('state', random_seed);
    randn('state', random_seed);
    W = init_weights(N+1);
    inputs = get_inputs(N);
    S = zeros(length(inputs));
    for i = 1:length(inputs),
        S(i) = inputs(i).output;
    end

    tole = 10^(-1);

    error = tole + 1;
    epoch = 1;
    while (error > tole && epoch < N_EPOCHS)
        perm = randperm(length(inputs));
        inputs = inputs(perm);
        S = S(perm);
        O = zeros(1,length(S));
        for xi_index = 1:length(inputs),
            xi = inputs(xi_index);                       % tomo una entrada al azar del conjunto de entradas
            h = potencial(W, xi);                        % calculo el potencial para esa entrada
            
            O(xi_index) = g(h);                          % calculo la salida para ese potencial
            Si = inputs(xi_index);                            % obtengo la salida real para esta entrada
            delta_W = delta(Si.output, O(xi_index), eta, xi, h);          % calculo las correcciones
            W = W + delta_W;                             % corrijo
        end
        error = calc_error(S, O);                       % calculo el error
        epoch = epoch + 1;
    end
    printf("params:\n");
    printf("eta: %f, randomSeed: %d, beta: %s\n", eta, random_seed, "?");
    printf("error: %f. Epochs: %d\n\n", error, epoch);

    printf("Truth Table Learned:\n\n");
    printf("Input   \t Oi \t\t Si \t\t (Oi-Si)^2\n");
    printf("------------------------------------------------------------\n");
    for i = inputs
        Oi = g(W*i.pattern');
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


%      e(w) = 1/2 * sum_(entradas) (si - oi)^2
%      wij_now = wij_old + delta_wij
%      delta_wij = eta * (si - oi) * tanh(entrada_i) entrada_j
%  
%      hi = sum_j=0...N wij entrada_j
%  
%  
%      h = potencial de membrana = suma
%      o = entradas * W
%      d = (s - o) * g'(h)
%      delta_wij = eta  * di * entrada

end
