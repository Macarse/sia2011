function ret = delta(S, O, h, g_diff, W)
    ret{length(W)} =  g_diff(h{length(W)}) * (S - O);

    for i = length(W)-1:1,
        ret{i} = g_diff(h{i}) * (slice_first(W{i+1})*slice_first(ret{i+1}));
    end

end
