a = 50;
r_max = a / 2;
n_max = 1000;
losuj = true;
x = [];
y = [];
r = [];
n = 0;
area=0;
S = [];
L = [];
f1 = figure;
while n <= n_max
    n = n+1;
    l = 1;
    while losuj
        x_new = a*rand;
        y_new = a*rand;
        r_new = r_max*rand;
        l = l + 1;
        if x_new < a && y_new < a && r_new < r_max
            if x_new - r_new > 0 && y_new - r_new > 0 && x_new + r_new < a && y_new + r_new < a
                for i=1:n
                    if i == n
                        x(n) = x_new;
                        y(n) = y_new;
                        r(n) = r_new;
                        losuj = false;
                        area=area+pi*r_new^2;
                    end
                    if r(i) + r_new >= sqrt((x(i) - x_new)^2 + (y(i) - y_new)^2)
                        break;
                    end
                end
            end
        end
    end
    L(n) = l;
    losuj = true;
    axis equal;
    plot_circ(x(n),y(n),r(n));
    hold on;
    S(n)=area;
    pause(0.01);
end
f2 = figure;
semilogx(S);
title("Powierzchnia calkowita");
xlabel("n");
f3 = figure;
L = cumsum(L);
i =1:1:n;
L(i) = L(i)./i;
loglog(L);
title("Srednia liczba losowan");
xlabel("n");
saveas(f1,'zad2-1.png');
saveas(f2,'zad2-2.png');
saveas(f3,'zad2-3.png');
