clc
clear all
close all
f1=figure;
f2=figure;
f3=figure;
f4=figure;
F=[f1,f2,f3,f4];
nazwy=["lab5_F1.png","lab5_F2.png","lab5_F3.png","lab5_F4.png"];
K = [5,15,25,35];
[XX,YY ]=meshgrid(linspace(0,100,101),linspace(0,100,101));
for i = 1:4
    [x,y,f,xp,yp]=lazik(K(i));
    figure(F(i));
    subplot(2,2,1);
    plot(xp,yp,'-o','linewidth',3);
    title("Tor ruchu łazika")
    xlabel("x[m]")
    ylabel("y[m]")

    subplot(2,2,2);
    plot3(x,y,f,'o');
    title("Zebrane wartości próbek")
    xlabel("x[m]")
    ylabel("y[m]")
    zlabel("f(x,y)")

    [p]=polyfit2d(x,y,f);
    [FF ]=polyval2d(XX,YY,p);

    subplot(2,2,3);
    surf(XX,YY,FF);
    title("Interpolacja wielomianowa")
    xlabel("x[m]")
    ylabel("y[m]")
    zlabel("f(x,y)")
    shading flat

    [p]=trygfit2d(x,y,f);
    [FF ]=trygval2d(XX,YY,p);

    subplot(2,2,4);
    surf(XX,YY,FF);
    title("Interpolacja trygonometryczna")
    xlabel("x[m]")
    ylabel("y[m]")
    zlabel("f(x,y)")
    shading flat
    saveas(gcf, nazwy(i));
    
end
K = 5:1:45;
FF_poly_pre=[];
FF_trig_pre=[];
FF_poly_nxt=[];
FF_trig_nxt=[];
div_poly=[];
div_trig=[];
for i = 1:size(K,2)
    [x,y,f,xp,yp]=lazik(K(i));
    if i > 1
        [p]=polyfit2d(x,y,f);
        [FF_poly_nxt]=polyval2d(XX,YY,p);
        
        [p]=trygfit2d(x,y,f);
        [ FF_trig_nxt]=trygval2d(XX,YY,p);

        div_poly(i-1) = max(max(abs(FF_poly_nxt-FF_poly_pre)));
        div_trig(i-1) = max(max(abs(FF_trig_nxt-FF_trig_pre)));
        FF_poly_pre=FF_poly_nxt;
        FF_trig_pre=FF_trig_nxt;
    else
        [p]=polyfit2d(x,y,f);
        [FF_poly_pre]=polyval2d(XX,YY,p);
        
        [p]=trygfit2d(x,y,f);
        [ FF_trig_pre]=trygval2d(XX,YY,p);
    end
end
f5=figure;
f6=figure;
figure(f5);
plot(div_poly);
title("div dla interpolacji wielomianowej");
saveas(gcf, "lab5_F5.png");
figure(f6);
plot(div_trig);
title("div dla interpolacji trygonometrycznej");
saveas(gcf, "lab5_F6.png");


