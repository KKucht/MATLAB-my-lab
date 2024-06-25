function [f_t] = gestosc_praw(t,mi,sigma)
f_t = 1 / (sigma * sqrt(2*pi))*exp(-(t - mi)^2/2/sigma^2);
end