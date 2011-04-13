function ret = main()

    random_seed = 1337;
    rand('state', random_seed);
    randn('state', random_seed);

    patterns = get_patterns_to_memorize();
    W = calc_weights(patterns);

    more off;

    test_patterns = get_patterns_to_test();

    image_index = 1;

    for test_pattern_i = test_patterns',
        test_pattern_i = test_pattern_i';
        S = [];
        S(1,:) = test_pattern_i;
        i = 1

        do
            i = i + 1
            indices = [1:length(test_pattern_i)];
            perm_indices = indices(randperm(length(indices)));
            S_temp = [];
            S_temp = S(i-1,:);
            j = 2;
            for index = perm_indices,
                new_state = sign( W(index,:) * S_temp(index)' );
                S_temp(index) = (new_state(index) == 0) * S_temp(index) + new_state(index);
                j = j + 1;
                S_temp;
            end

            S(i,:) = S_temp;
            S
        until (all(S(i,:) == S(i-1,:)))

        filename = ["output/",int2str(image_index),".txt"]

        fid=fopen('newFile.xls', 'w');
        for value = S(i,:)
            fprintf(fid,'%d\n', value);
        end
        fclose(fid);



        image_index = image_index +1;

    end

    ret = 0;


end