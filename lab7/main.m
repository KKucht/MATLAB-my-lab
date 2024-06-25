clc
clear all

load('P_ref.mat')
a = 0;
b = 5;
blad_kwad = [];
blad_trap = [];
blad_sim = [];
blad_monte = [];

for N = 5:50:10^4
    %metoda prostokatow
    delta = (b - a)/N;
    suma = 0;

    for j = 1:N
        x_l = a + (j-1)*delta;
        x_p = a + j*delta;
        suma = suma + gestosc_praw((x_l+x_p)/2,10,3)*delta;
    end
    blad_kwad = [blad_kwad; abs(suma - P_ref)];

    %metoda traperzow
    delta = (b - a)/N;
    suma = 0;

    for j = 1:N
        x_l = a + (j-1)*delta;
        x_p = a + j*delta;
        suma = suma + (gestosc_praw(x_p,10,3)+gestosc_praw(x_l,10,3))/2*delta;
    end
    blad_trap = [blad_trap; abs(suma - P_ref)];

    %metoda simpsona
    delta = (b - a)/N;
    suma = 0;

    for j = 1:N
        x_l = a + (j-1)*delta;
        x_p = a + j*delta;
        suma = suma + (x_p - x_l)/6*(gestosc_praw(x_p,10,3)+4*gestosc_praw((x_p+x_l)/2,10,3)+gestosc_praw(x_l,10,3));
    end
    blad_sim = [blad_sim; abs(suma - P_ref)];

    %metoda monte carlo
    h = 5;
    suma_praw = 0;
    for j = 1:N
        x = rand()*(b - a) + a;
        y = rand()*h;
        if gestosc_praw(x,10,3) >= y
            suma_praw = suma_praw +1;
        end
    end
    suma = (b - a)*h*suma_praw/N;
    blad_monte = [blad_monte; abs(suma - P_ref)];


    


end
loglog(5:50:10^4,blad_kwad)
hold on
loglog(5:50:10^4,blad_trap)
hold on
loglog(5:50:10^4,blad_sim)
hold on
loglog(5:50:10^4,blad_monte)
xlabel('liczba przedzialow')
ylabel('blad')
legend('metoda kwadratow','metoda trapezow','metoda simpsona','metoda monte carlo',"Location","southwest")
saveas(gcf, '184568_Kuchta_a2.png');
hold off
time = [];
N = 10^7;
delta = (b - a)/N;
suma = 0;
tic;
for j = 1:N
    x_l = a + (j-1)*delta;
    x_p = a + j*delta;
    suma = suma + gestosc_praw((x_l+x_p)/2,10,3)*delta;
end

time(1) = toc;
%metoda traperzow
delta = (b - a)/N;
suma = 0;
tic;
for j = 1:N
    x_l = a + (j-1)*delta;
    x_p = a + j*delta;
    suma = suma + (gestosc_praw(x_p,10,3)+gestosc_praw(x_l,10,3))/2*delta;
end


time(2) = toc;
%metoda simpsona
delta = (b - a)/N;
suma = 0;
tic
for j = 1:N
    x_l = a + (j-1)*delta;
    x_p = a + j*delta;
    suma = suma + (x_p - x_l)/6*(gestosc_praw(x_p,10,3)+4*gestosc_praw((x_p+x_l)/2,10,3)+gestosc_praw(x_l,10,3));
end

time(3) = toc;
%metoda monte carlo
h = 5;
suma_praw = 0;
tic
for j = 1:N
    x = rand()*(b - a) + a;
    y = rand()*h;
    if gestosc_praw(x,10,3) >= y
        suma_praw = suma_praw +1;
    end
end
suma = (b - a)*h*suma_praw/N;
time(4) = toc;




vector = categorical({'kwadraty','trapezy','simpsona','monte carlo'});
bar(vector,time);
%labels=['kwadraty','trapezy','simpsona','monte carlo']
set(gca, 'XTickLabel',vector);
saveas(gcf, '184568_Kuchta_a1.png');




