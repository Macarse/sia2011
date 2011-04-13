function ret = main()

    patterns = get_patterns_to_memorize();
    W = calc_weights(patterns)


    test_patterns = get_patterns_to_test();

    for test_pattern_i = test_patterns',
        test_pattern_i = test_pattern_i';
        S = [];
        S(1,:) = test_pattern_i;
        i = 1;
        do
            i = i + 1
            new_state = sign( W * S(i-1,:)' );
            S(i,:) = (new_state == 0) .* S(i-1,:)' + new_state;
            S
        until (all(S(i,:) == S(i-1,:)))

    end

    ret = 0;


end