function ret = delta(S, O, h, g_diff, W)
    ret = {};
    ret(length(W)) =  g_diff(h{length(W)}) * (S - O);

    for i = length(W)-1:-1:1,

        % Wii = W{i+1} sliced
        i;
        Wii = W{i+1};
        delta_ii = ret{i+1};
        g_diff(h{i});

        ret{i} = g_diff(h{i}) .* (Wii*delta_ii);
    end


end
