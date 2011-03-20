
function y = main()

    params = getParams();

    random_seed = 31337;
    rand('state', random_seed);
    randn('state', random_seed);
    
    W = init_weights(params.N+1);
    inputs = get_inputs(params.N);
    S = zeros(length(inputs));
    for i = 1:length(inputs),
        S(i) = inputs(i).output;
    end

    tole = 10^(-1);

    error = tole + 1;
    epoch = 1;
	error_per_epoch = [];

    while (error > tole && epoch < params.N_EPOCHS)
        perm = randperm(length(inputs));
        inputs = inputs(perm);
        S = S(perm);
        O = zeros(1,length(S));
        for xi_index = 1:length(inputs),
            xi = inputs(xi_index);                       % tomo una entrada al azar del conjunto de entradas
            h = potencial(W, xi);                        % calculo el potencial para esa entrada

            O(xi_index) = params.g(h);                          % calculo la salida para ese potencial
            Si = inputs(xi_index);                            % obtengo la salida real para esta entrada
            delta_W = delta(Si.output, O(xi_index), params.eta, xi, h, params.g_diff);          % calculo las correcciones
            W = W + delta_W;                             % corrijo
        end
        error = calc_error(S, O);                       % calculo el error
        error_per_epoch(epoch) = error;
        epoch = epoch + 1;
    end

    figure(01)
    plot([1:1:epoch-1], error_per_epoch);
    xlabel("Epocas");
    ylabel("Error Cuadratico medio");
    title("Error Cuadratico medio por epoca");
    replot
    drawnow;

    printf("params:\n");
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
