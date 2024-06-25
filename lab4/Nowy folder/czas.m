function [value]=czas(N)
t = 5000;
value = t - (N^1.43 + N^1.14)/1000;
end
