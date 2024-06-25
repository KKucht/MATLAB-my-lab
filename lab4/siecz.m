function [xvect,xdif,fx,it_cnt] = siecz(a, b, eps, fun)
 x_i_minus_1 = a;
  x_i = b;

  for i = 1:1000
    fx_i = feval(fun, x_i);
    fx_i_minus_1 = feval(fun, x_i_minus_1);
    x_i_plus_1 = x_i - (fx_i)*(x_i - x_i_minus_1)/(fx_i - fx_i_minus_1);
    xvect(i) = x_i_plus_1;
    xdif(i) = abs(x_i_plus_1 - x_i);
    fx(i) = feval(fun, x_i_plus_1);

    if abs(fx(i)) < eps
      it_cnt = i;
      return;
    end
    
    x_i_minus_1 = x_i;
    x_i = x_i_plus_1;
  end
  it_cnt = - 100000
end