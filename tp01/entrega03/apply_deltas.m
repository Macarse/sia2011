function ret = apply_deltas(W, delta_w)

    ret = {};
    for i = 1:length(W),
        zero = zeros(length(delta_w{i}), 1);
        DWi = delta_w{i}';
        ret(i) = W{i} + DWi;
    end

end
