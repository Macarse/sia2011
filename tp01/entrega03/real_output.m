function ret = real_output(pattern)

    r = pattern(2) == 1;
    for i = 3:length(pattern)
        value = pattern(i) == 1;
        r = xor(r,value);
    end
    if (r == 1)
        ret = 1;
    else
        ret = -1;
end
