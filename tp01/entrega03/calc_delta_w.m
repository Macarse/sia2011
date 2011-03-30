function ret = calc_delta_w(delta_mini, eta, h, g, input)
    ret = {};

    for i = length(h)-1:-1:1,
        i;
        delta_mini_i = delta_mini{i+1};
        ghi =  g(h{i})';
        ret(i+1) = eta * delta_mini_i * ghi;
    end
    ret(1) = eta * delta_mini{1} * input;

end
