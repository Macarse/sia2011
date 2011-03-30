function ret = calc_error(S, O)

    ret = 0.5 * sum((S - O).^2);

end
