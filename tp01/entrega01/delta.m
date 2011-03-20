function ret = delta(S, O, eta, xi, h)
	global g_diff;
    ret = (eta * (S - O) * g_diff(h) * xi.pattern')';

end
