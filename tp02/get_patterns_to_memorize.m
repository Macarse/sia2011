
function ret = get_patterns_to_memorize()
    ret = {};
    ret.names = {
           'line4';
           'line1';
           'line2';
           'line3';

    };
    ret.values = [
           load('data/line4.txt')';
           load('data/line1.txt')';
           load('data/line2.txt')';
           load('data/line3.txt')';

            ];

end
