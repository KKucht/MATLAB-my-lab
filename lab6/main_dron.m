clc
clear all
close all

warning('off','all')

load trajektoria1


plot3(x,y,z,'o');
grid on;
axis equal;

N = 50;

[ wsp_wielomianu, xa ] = aproksymacjaWiel(n,x,N);  % aproksymacja wsp. 'x'.
[ wsp_wielomianu, ya ] = aproksymacjaWiel(n,y,N);  % aproksymacja wsp. 'y'.
[ wsp_wielomianu, za ] = aproksymacjaWiel(n,z,N);  % aproksymacja wsp. 'z'.
f1=figure;
subplot(1,2,1);
plot3(x,y,z,'o');
title('Lokalizacja')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
grid on;
axis equal;
subplot(1,2,2);
plot3(xa,ya,za,'linewidth',4);
title('Aproksymowana')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
grid on;
axis equal;
saveas(gcf, '184568_Kuchta_zad4.png');

clc
clear all
close all

warning('off','all')

load trajektoria2
N = 60;

[ wsp_wielomianu, xa ] = aproksymacjaWiel(n,x,N);  % aproksymacja wsp. 'x'.
[ wsp_wielomianu, ya ] = aproksymacjaWiel(n,y,N);  % aproksymacja wsp. 'y'.
[ wsp_wielomianu, za ] = aproksymacjaWiel(n,z,N);  % aproksymacja wsp. 'z'.
f2 = figure;
subplot(1,2,1);
plot3(x,y,z,'o');
title('Lokalizacja')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
grid on;
axis equal;
subplot(1,2,2);
plot3(xa,ya,za,'linewidth',4);
title('Aproksymowana')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
grid on;
axis equal;
saveas(gcf, '184568_Kuchta_zad5_a.png');
err=[];
for i = 1:71
    errx = 0;
    errz = 0;
    erry = 0;
    [ wsp_wielomianu, xa ] = aproksymacjaWiel(n,x,i);  % aproksymacja wsp. 'x'.
    [ wsp_wielomianu, ya ] = aproksymacjaWiel(n,y,i);  % aproksymacja wsp. 'y'.
    [ wsp_wielomianu, za ] = aproksymacjaWiel(n,z,i);  % aproksymacja wsp. 'z'.
    for j = 1:size(xa,2)
        errx = errx + (x(j) - xa(j))^2;
        errz = errz + (z(j) - za(j))^2;
        erry = erry + (y(j) - ya(j))^2;
    end
    errx = sqrt(errx)/size(xa,2);
    errz = sqrt(errz)/size(xa,2);
    erry = sqrt(erry)/size(xa,2);
    err(i) = errx + errz + erry;
end
f3=figure;
semilogy(1:71,err);
title('Blad')
xlabel('N')
ylabel('err')
saveas(gcf, '184568_Kuchta_zad5_b.png');

clc
clear all
close all

warning('off','all')

load trajektoria2
N = 60;

[  xa ] = aprox_tryg(n,x,N);  % aproksymacja wsp. 'x'.
[  ya ] = aprox_tryg(n,y,N);  % aproksymacja wsp. 'y'.
[  za ] = aprox_tryg(n,z,N);  % aproksymacja wsp. 'z'.
f2 = figure;
subplot(1,2,1);
plot3(x,y,z,'o');
title('Lokalizacja')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
grid on;
axis equal;
subplot(1,2,2);
plot3(xa,ya,za,'linewidth',4);
title('Aproksymowana')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
grid on;
axis equal;
saveas(gcf, '184568_Kuchta_zad6_a.png');
err=[];
for i = 1:71
    errx = 0;
    errz = 0;
    erry = 0;
    [ xa ] = aprox_tryg(n,x,i);  % aproksymacja wsp. 'x'.
    [ ya ] = aprox_tryg(n,y,i);  % aproksymacja wsp. 'y'.
    [ za ] = aprox_tryg(n,z,i);  % aproksymacja wsp. 'z'.
    for j = 1:size(xa,2)
        errx = errx + (x(j) - xa(j))^2;
        errz = errz + (z(j) - za(j))^2;
        erry = erry + (y(j) - ya(j))^2;
    end
    errx = sqrt(errx)/size(xa,2);
    errz = sqrt(errz)/size(xa,2);
    erry = sqrt(erry)/size(xa,2);
    err(i) = errx + errz + erry;
end
f3=figure;
semilogy(1:71,err);
title('Blad')
xlabel('N')
ylabel('err')
saveas(gcf, '184568_Kuchta_zad6_b.png');











