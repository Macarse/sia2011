function ret = fixpoint(ws, pattern)
    s = sign(ws * pattern')';
    ret = all(s == pattern);
end
