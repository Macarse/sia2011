function ret = delta(S, O, eta, xi, h)

    ret = eta * (S - O) * g_diff(h) * xi.pattern';

end