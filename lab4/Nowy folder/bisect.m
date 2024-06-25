function [xvect,xdif,fx,it_cnt]=bisect(a,b,eps,fun)


for i = 1:1000
    x = (a + b)/2;
    xvect(i) = x;
    fx(i) = feval(fun,x);
    if i > 1
        xdif(i - 1) = abs(xvect(i)-xvect(i - 1));
    end
    if or(abs(fx(i)) < eps , abs(a - b) < eps)
        it_cnt = i;
        return;
    elseif fx(i)*feval(fun,a) < 0
        b = x;
    else
        a = x;
    end
end
it_cnt = -100;
end

