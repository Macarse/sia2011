function ret = real_output(pattern)

    r = 1;
    for i = 2:length(pattern)
        value = pattern(i) == 1;
        r = r && value;
    end
    if (r == 1)
        ret = 1;
    else
        ret = -1;
end
