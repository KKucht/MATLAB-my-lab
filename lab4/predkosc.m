function [value]=predkosc(t)
g =9.81;
m0 = 150000;
q = 2700;
u =2000;
v = 750;
value = v - u*log(m0/(m0 - q*t)) - g*t;
end