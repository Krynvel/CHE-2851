%% Part A, 1.) 
function dQP = RO_model_fxn(x,QP_1,Am,Lp,k,Q_0,pi_0)
dQP = zeros(2,1);
%% QP(1): Q - Transmembrane Water Flow Rate 
dQP(1) = -Am*Lp*(QP_1(2)-(Q_0*pi_0/QP_1(1)));
%% QP(2): P - System Pressure
dQP(2) = -k*(QP_1(1)^2); %*QP_1(1);
