%% Part B, 1.)
function Y = Calc_RO_Y(Q_0,H)

H = 360; % Pump Head (ft.)
Q_0 = 1525; % Feed Flow (gpm)
%% Stage 1
Am = 28*7*400; % Membrane Area (ft^2)
Lp = 0.11/24/60; % (gallon per ft^2 per min/per psi)
k = 2.12e-5; % (psi/gpm^2)
pi_0 = 9;  % Feed Osmotic Pressure(psi)
 
dP_0 = 40.6+H*0.4327-16.4; % Transmembrane Inlet Pressure (psi)
[x,QP_1]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am,Lp,k,Q_0,pi_0),[0 1],[Q_0,dP_0]);
%% Stage 2
Q_1 = QP_1(end,1); % Calls final value from Stage 1
dP_1 = QP_1(end,2); % Calls final value from Stage 1
Am_2 = Am/2; % Membrane Area (ft^2)
Lp_2 = Lp; % (gallon per ft^2 per min/per psi)
k2 = k*4; % (psi/gpm^2)
[x2,QP_2]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am_2,Lp_2,k2,Q_0,pi_0),[1 2],[Q_1,dP_1]);

Y = 1 - QP_2(end,1)/Q_0;
