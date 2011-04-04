function ret = get_inputs(params)

    ret = []; 
    pos = 1;
    for i = 0:params.step:4

		ret(pos).pattern = [-1 i];
        ret(pos).output = func(i);
        pos = pos+1;
    end
    if (params.repeat)
        for i = [0:params.step:4]
            deriv = abs((func(i) - func(i-0.01))/0.01);
            if (deriv < 0.1)
                repeatt = (0.5/(deriv+0.01));
                for cant = 1:repeatt
                    ret(pos).pattern = [-1 i];
                    ret(pos).output = func(i);
                    pos = pos +1;
                end
            endif
        end
    endif


    %x = [0:0.01:4];
    %y = CDF(x) / 0.6242;
    %r = rand(1,length(x));

    %pos = 1;
    %values =[];
    %for i = r
    %    prev = 0;
    %    pos2 = 1;
    %    for j = y
    %        if prev < i && i < j
    %            value = x(pos2);
    %        endif
    %        pos2 = pos2 + 1;           
    %    end
    %    ret(pos).pattern = [-1 value];
    %    ret(pos).output = func(value);
    %    values(pos)=value;
    %    pos = pos+1;
    %end

end
