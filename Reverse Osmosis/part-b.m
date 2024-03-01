for i = 1:10 
    Y(i) = 0.76+0.02*i;
    Q0(i) = 1234/Y(i);
    H(i) = fsolve(@(H)Calc_H(H,Q0(i),Y(i)), 180)
end
