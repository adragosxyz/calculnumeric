clear all
%% Matrici si vectori
% Vectori
A = [1;2;3]
B = [2;4;5]
dot(A,B)
transpose(A)*B
A'*B
sum(A)

[maxB,indicemax] = max(B)

% Matrici
C = [1 2 3; 4 5 7; 2 8 9]
A'*C
D = [2 4 5; 1 3 4; 2 1 0]
C*D
D*C
C^3
inv(C)
C(1,2)
C(1,:)
C(1,1:3)
C(1,1:2:3) %(inceput, pas, sfarsit)
C(1,[1,2]) %[] - array de indecsi coloana
C([2,3],[1,2])
A(:)
det(C)
det(D)
C.*D %efectuare operatii element cu element
C./D
C.^3
%% Definirea matricilor si vectorilor 
% Operatii cu acestia
% Generarea vectorilor
% a = amin:pas:amax
% b = linspace(amin,amax,N)
% pas = (amax-amin)/(N-1)
a = 1:2:10
% format SHORT
b = linspace(1,10,5)
%% Grafice de functii
x = linspace(0,2*pi,100)
y = sin(x)
z = cos(x)
plot(x,y, 'r','Linewidth',3)
grid on
title('Functiile sin(x), cos(x)')
xlabel('abcisa x')
ylabel('ordonata y')
hold on
plot(x,z, '.-g', 'Linewidth',3)
text(3.3,0,'sin(x)','Edgecolor','r')
text(4.9,0,'cos(x)','Edgecolor','g')
hold off
subplot(2,2,1)
plot(x,y, 'r','Linewidth',3)
subplot(2,2,2)
plot(x,z, '.-g', 'Linewidth',3)
subplot(2,2,3)
xp = -2:0.1:2
p1 = xp.^2 + 2
p2 = xp.^3 - 2*xp.^2
plot(xp, p1, 'b','Linewidth',3)
subplot(2,2,4)
plot(xp, p2, 'k','Linewidth',3)
