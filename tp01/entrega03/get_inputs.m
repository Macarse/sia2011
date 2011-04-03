function ret = get_inputs()

    ret = []; 

    pos = 1;
    for i = 0:0.001:4

        ret(pos).pattern = i;
        ret(pos).output = func(i);
        pos = pos+1;
    end
end
