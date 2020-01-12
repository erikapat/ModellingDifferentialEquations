
%orden sin conocer solución real
function [oH, oR] = ordenNumericoSistema(fun, a, b, ya)

n = 1:6;
N = 20*2.^n;

for j = 1:n(end)
    [~, yH2] = Heun_sistemas_1(fun, a, b, N(j), ya);
    [~, yR2] = RK_4_N(fun, a, b, N(j), ya);
    
    if j>1 
        eH(j-1) = norm(yH(:,1)-yH2(1:2:end,1));
        eR(j-1) = norm(yR(:,1)-yR2(1:2:end,1));
    end
    
    yH = yH2;
    yR = yR2;
   
end

oH = log2(eH(1:end -1)./eH(2:end)); %solución
oR = log2(eR(1:end -1)./eR(2:end));


