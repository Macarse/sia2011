function ret = delta(S, O, eta, xi, h, g_diff)
    ret = (eta * (S - O) * g_diff(h) * xi.pattern')';
end
