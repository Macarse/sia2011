function ret = CDF(x)

    %ret = (-1/101).*exp(-x) .* sign(sin(10.*x)) .* (sin(10.*x) + 10 .* cos(10.*x));
    ret = [];
    ret(1) = 0;
    for i = 2:length(x)
        [area,ierror,nfneval]=quad("func_mod",x(i-1),x(i));
        ret(i)=area + ret(i-1);
    end

end
