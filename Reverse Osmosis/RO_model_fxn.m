function dQP = RO_model_fxn(x,QP,Am,Lp,k,Q0,pi0)
%% QP(1): Q
%% QP(2): P
dQP = zeros(2,1);
dQP(1) = -Am*Lp*(QP(2)-Q0*pi0/QP(1));
dQP(2) = -k*QP(1)*QP(1);

