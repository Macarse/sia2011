function ret = apply_momentum(old_delta_w, delta_w, params)

    ret = {};
    
    for i = 1:length(delta_w),
        ret(i) = delta_w{i} + params.momentum_alpha * old_delta_w{i};
    end
end
