function [x, niters] = fletcher_reeves(A, b)
n = length(b); % długość wektora b
maxiters = max(100,sqrt(n)); %wybór maksymalnej liczby iteracji
normb = norm(b); %norm
x = zeros(n,1); % wektor iksów początkowych startujących  w 0
r = b;
rtr = r'*r; %przemnożenie wektora b tranponowanego przez wektor b
d = r; 
niters = 0; %liczba iteracji - zerowanie
while sqrt(rtr)/normb > 1e-6  &&  niters < maxiters %warunek stopu liczy dopóki norma nie spadnie do 10^-6
    niters = niters+1;
    Ad = A*d;
    alpha = rtr / (d'*Ad); %gradient
    x = x + alpha * d; 
    r = r - alpha * Ad; 
    rtrold = rtr;
    rtr = r'*r;
    beta = rtr / rtrold; %gradient
    d = r + beta * d;
end;
