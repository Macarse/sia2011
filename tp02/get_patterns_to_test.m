
function ret = get_patterns_to_test()
    ret = {};
    ret.names = [
           'h';
           'f';

    ];
    ret.values = [
           load('data/h.txt')';
           load('data/f.txt')';

    ];
end
