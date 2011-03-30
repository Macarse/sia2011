function ret = apply_deltas(W, delta_w)

    ret = {};
    for i = 1:length(W),
        i;
        W{i};
        zero = zeros(length(delta_w{i}), 1);
        delta_w{i};
        DWi = delta_w{i}';
        ret(i) = W{i} + DWi;
    end

end
