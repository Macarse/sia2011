function ret = main()

    random_seed = 1337;
    rand('state', random_seed);
    randn('state', random_seed);

    patterns = get_patterns_to_memorize();
    w = calc_weights(patterns.values);
    more off;

    for (i = 1:rows(patterns.values))
        if (fixpoint(w.ws, patterns.values(i,:)))
            printf("Pattern %s is a fixed point\n", patterns.names{i});
        endif

        crosstalk = sum(sum(((w.ws_o * patterns.values(i, :)')' - patterns.values(i, :) > 1)));
        if (crosstalk != 0)
            printf("Pattern %s -> crosstalk %d\n", patterns.names{i}, crosstalk);
        endif
    endfor

    test_patterns = get_patterns_to_test();
    image_index = 1;

    name_index = 0;
    for test_pattern_i = test_patterns.values',
        name_index = name_index + 1;
        test_pattern_i = test_pattern_i';
        S = [];
        S(1,:) = test_pattern_i;
        i = 1;

        do
            i = i + 1;
            indices = [1:length(test_pattern_i)];
            perm_indices = indices(randperm(length(indices)));
            S_temp = [];
            S_temp = S(i-1,:);
            j = 2;
            for index = perm_indices,
                new_state = sign( w.ws(index,:) * S_temp(index)' );
                S_temp(index) = (new_state(index) == 0) * S_temp(index) + new_state(index);
                j = j + 1;
            end

            S(i,:) = S_temp;
        until (all(S(i,:) == S(i-1,:)))

        filename = ["output/",test_patterns.names{name_index},".txt"];

        fid=fopen(filename, 'w');
        for value = S(i,:)
            fprintf(fid,'%d\n', value);
        end
        fclose(fid);



        image_index = image_index +1;

    end

    ret = 0;


end