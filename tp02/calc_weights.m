function ret = calc_weights(patterns)
    N = length(patterns(1,:));
    annulator = ones(N) - eye(N);
    ret.ws_o = 1/N * (patterns' * patterns);
    ret.ws = ret.ws_o .* annulator;
end