function ret = calc_delta_w(delta_mini, eta, h, g)
    for i = 1:length(h),
        ret{i} = eta * delta_mini{i} * g(h{i})';
    end

end