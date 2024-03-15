%% Part B, 2.)

function err = Calc_H(H,Q_0,Ysp)

Y = Calc_RO_Y(Q_0,H);
err = abs(1-Y/Ysp);
