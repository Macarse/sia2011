function ret = calc_weights(patterns)
    N = length(patterns(1,:));
    annulator = ones(N) - eye(N);
    ret = 1/N * (patterns' * patterns);
    ret = ret .* annulator;
end