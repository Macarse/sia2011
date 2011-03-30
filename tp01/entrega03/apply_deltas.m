function ret = apply_deltas(W, delta_w)

    ret = {};
    for i = 1:length(W),
        %i
        %W{i}
        %[zeros(length(delta_w{i}),1) delta_w{i}]
        ret(i) = W{i} + [zeros(length(delta_w{i}),1) delta_w{i}];
    end

end