clc
clear all
close all
diary('log_184568_lab3')
% odpowiednie fragmenty kodu mo¿na wykonaæ poprzez znazaczenie i wciœniêcie F9
% komentowanie/ odkomentowywanie: ctrl+r / ctrl+t

% Zadanie A
%------------------
N = 10;
density = 3; % parametr decyduj¹cy o gestosci polaczen miedzy stronami
[Edges] = generate_network(N, density);
%-----------------

% Zadanie B
%------------------
% generacja macierzy I, A, B i wektora b
% ...
  % macierze A, B i I musz¹ byæ przechowywane w formacie sparse (rzadkim)
d = 0.85;
B = sparse(Edges(2,:), Edges(1,:), 1, N, N);
A = spdiags((1./sum(B(:,1:1:N)))',0,N,N);
I = speye(N);
b = (1 - d)*ones(N,1)/N;

save zadB_184568 A B I b
%-----------------

% Zadnie C
M = I - d*B*A;
r = M\b;
save zadC_184568 r


% Zadanie D
%------------------
clc
clear all
close all

N = [500, 1000, 3000, 6000, 12000];
density = 10;


for i = 1:5
    [Edges] = generate_network(N(i), density);
    d = 0.85;
    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    A = spdiags((1./sum(B(:,1:1:N(i))))',0,N(i),N(i));
    I = speye(N(i));
    b = (1 - d)*ones(N(i),1)/N(i);
    M = I - d*B*A;
tic
% obliczenia
    r = M\b;
czas_Gauss(i) = toc;
end

plot(N, czas_Gauss)
title("Gauss - Czas analizy");
ylabel("t [s]");
xlabel("Rozmiar");
saveas(gcf, 'zadD_184568.png');
%------------------



% Zadanie E
%------------------
clc
clear all
close all


% przyk³ad dzia³ania funkcji tril, triu, diag:
 %Z = rand(4,4)
 %tril(Z,-1) 
 %triu(Z,1) 
 %diag(diag(Z))

N = [500, 1000, 3000, 6000, 12000];
d = 0.85;
density = 10;

for i = 1:5
    [Edges] = generate_network(N(i), density);
    d = 0.85;
    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    A = spdiags((1./sum(B(:,1:1:N(i))))',0,N(i),N(i));
    I = speye(N(i));
    b = (1 - d)*ones(N(i),1)/N(i);
    M = I - d*B*A;

    L = triu(M,1);
    U = tril(M,-1);
    D = diag(diag(M));
    
    element1 = -D\(L+U);
    element2 = D\b;
    
    r = ones(N(i),1);
    
tic
% obliczenia
x = 0;
    while(true)
        x = x + 1;
        r = element1 * r + element2;
        res = M * r - b;
        residuum(i , x) =  norm(res);
        if (norm(res) <= 10^(-14))
            break;
        end
    end
czas_Jacobi(i) = toc;
iteration(i) = x;
end

plot(N, czas_Jacobi)
title("Jacobi - Czas analizy");
ylabel("t [s]");
xlabel("Rozmiar");
saveas(gcf, 'zadE_184568_1.png');

plot(N, iteration)
title("Jacobi - iteracje");
ylabel("iteracje");
xlabel("Rozmiar");
saveas(gcf, 'zadE_184568_2.png');


for i = 1:5
    semilogy(residuum(i,:));
    hold on
end
legend('500', '1000', '3000', '6000', '12000');
title('Jacobi - Norma z residuum')
ylabel("Norma");
xlabel("Iteracja");
saveas(gcf, 'zadE_184568_3.png');
hold off
%------------------

% Zadanie F
%------------------
clc
clear all
close all

N = [500, 1000, 3000, 6000, 12000];
d = 0.85;
density = 10;

for i = 1:5
    [Edges] = generate_network(N(i), density);
    d = 0.85;
    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    A = spdiags((1./sum(B(:,1:1:N(i))))',0,N(i),N(i));
    I = speye(N(i));
    b = (1 - d)*ones(N(i),1)/N(i);
    M = I - d*B*A;

    L = triu(M,1);
    U = tril(M,-1);
    D = diag(diag(M));
    
    element1 = -(D+L);
    element2 = (D+L)\b;
    
    r = ones(N(i),1);
    
tic
% obliczenia
x = 0;
    while(true)
        x = x + 1;
        r = element1\(U * r) + element2;
        res = M * r - b;
        residuum(i , x) =  norm(res);
        if (norm(res) <= 10^(-14))
            break;
        end
    end
czas_GaussaSeidla(i) = toc;
iteration(i) = x;
end

plot(N, czas_GaussaSeidla)
title("Gaussa-Seidla - Czas analizy");
ylabel("t [s]");
xlabel("Rozmiar");
saveas(gcf, 'zadF_184568_1.png');

plot(N, iteration)
title("Gaussa-Seidla - iteracje");
ylabel("iteracje");
xlabel("Rozmiar");
saveas(gcf, 'zadF_184568_2.png');

for i = 1:5
    semilogy(residuum(i,:));
    hold on
end
title('Gaussa-Seidla - Norma z residuum')
legend('500','1000', '3000', '6000', '12000');
ylabel("Norma");
xlabel("Iteracja");
saveas(gcf, 'zadF_184568_3.png');
hold off
%------------------
% Zadanie G
%------------------
clc
clear all
close all
load("Dane_Filtr_Dielektryczny_lab3_MN.mat")
[N,X] = size(M);
r = M\b;
save zadG_Gauss_184568 r

L = triu(M,1);
U = tril(M,-1);
D = diag(diag(M));

element1 = -D\(L+U);
element2 = D\b;
    

max_iteration = 1000;

r = ones(N,1);

for i = 1:max_iteration
    r = element1 * r + element2;
    res = M * r - b;
end

if (norm(res) <= 10^(-14))
    fprintf("Jacobi - zbiega sie\n")
else
    fprintf("Jacobi - nie zbiega sie\n")
end
save zadG_Jacobi_184568 r

element1 = -(D+L);
element2 = (D+L)\b;
    
r = ones(N,1);

for i = 1:max_iteration
    r = element1\(U * r) + element2;
    res = M * r - b;
end

if (norm(res) <= 10^(-14))
    fprintf("Gaussa-Seidla - zbiega sie\n")
else
    fprintf("Gaussa-Seidla - nie zbiega sie\n")
end
save zadG_Gaussa-Seidla_184568 r