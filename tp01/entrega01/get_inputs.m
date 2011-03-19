function ret = get_inputs(N)

    inputs = []; 
    for i = 1:(2^N)
        temp = zeros(1,N+1);
        temp(1) = -1;
        for j = 2:(N+1)
            k = j-1;
            temp(j) = mod(floor( i / (2^(N-k))), 2);
        end
        out = real_output(temp);

        inputs(i).pattern = temp;
        inputs(i).output = out;
    end
    ret = inputs;
end
