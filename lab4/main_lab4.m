clc
clear all
close all


a = 1;   
b = 60000;

[xvect, xdif, fx, it_cnt] = bisect(a,b,1e-3,@czas);

plot(xvect)
title("Bisekcja Czas - xvect");
ylabel("xvect");
xlabel("iteracja");
saveas(gcf, 'xvect_bis_czas.png');

semilogy(xdif)
title("Bisekcja Czas");
ylabel("xdif");
xlabel("iteracja");
saveas(gcf, 'xdif_bis_czas.png');
clc
clear all
close all


a = 1;   
b = 60000;

[xvect, xdif, fx, it_cnt] = siecz(a,b,1e-3,@czas);

plot(xvect)
title("Motoda Siecznych Czas - xvect");
ylabel("xvect");
xlabel("iteracja");
saveas(gcf, 'xvect_siecz_czas.png');

semilogy(xdif)
title("Motoda Siecznych Czas - xdif");
ylabel("xdif");
xlabel("iteracja");
saveas(gcf, 'xdif_siecz_czas.png');
clc
clear all
close all


a = 0;   
b = 50;

[xvect, xdif, fx, it_cnt] = bisect(a,b,1e-12,@modul);

plot(xvect)
title("Bisekcja Modul - xvect");
ylabel("xvect");
xlabel("iteracja");
saveas(gcf, 'xvect_bis_modul.png');

semilogy(xdif)
title("Bisekcja Modul - xdif");
ylabel("xdif");
xlabel("iteracja");
saveas(gcf, 'xdif_bis_modul.png');
clc
clear all
close all


a = 0;   
b = 50;

[xvect, xdif, fx, it_cnt] = siecz(a,b,1e-12,@modul);

plot(xvect)
title("Metoda Siecznych Modul - xvect");
ylabel("xvect");
xlabel("iteracja");
saveas(gcf, 'xvect_siecz_modul.png');

semilogy(xdif)
title("Metoda Siecznych Modul - xdif");
ylabel("xdif");
xlabel("iteracja");
saveas(gcf, 'xdif_siecz_modul.png');
clc
clear all
close all


a = 0;   
b = 50;

[xvect, xdif, fx, it_cnt] = bisect(a,b,1e-12,@predkosc);

plot(xvect)
title("Bisekcja Predkosc - xvect");
ylabel("xvect");
xlabel("iteracja");
saveas(gcf, 'xvect_bis_predkosc.png');

semilogy(xdif)
title("Bisekcja Predkosc - xdif");
ylabel("xdif");
xlabel("iteracja");
saveas(gcf, 'xdif_bis_predkosc.png');
clc
clear all
close all


a = 0;   
b = 50;

[xvect, xdif, fx, it_cnt] = siecz(a,b,1e-12,@predkosc);

plot(xvect)
title("Motoda Siecznych Predkosc - xvect");
ylabel("xvect");
xlabel("iteracja");
saveas(gcf, 'xvect_siecz_predkosc.png');

semilogy(xdif)
title("Motoda Siecznych Predkosc - xdif");
ylabel("xdif");
xlabel("iteracja");
saveas(gcf, 'xdif_siecz_predkosc.png');