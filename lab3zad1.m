diary('log_184568_lab3')
N = 10;
density = 3;
Edges = generate_network(N,density,184568);
B = Edges';
d = 0.85;
I = speye(N);
b = (1 - d)*ones(N,1)/N;
L = 1:1:N;
V = 1./sum(B(:,L));
A = spdiags(V',0,N,N);
M = I - d*B*A;
r = M\b;
f0 = figure;
bar(r);
saveas(f0,'zad1.png');



