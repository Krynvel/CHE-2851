%% Part B, 1.)

function Y = Calc_RO_Y(Q_0,H)

%% Stage 1
Am = 28*7*400; % Membrane Area (ft^2)
Lp = 0.11/24/60; % Membrane Hydraulic Permeability (gpm/psi)
k = 2.12e-5; % Constant for Stage 1 (psi/gpm^2)
pi_0 = 9; % Osmotic Pressure (psi)
dP_0 = 40.6+(H*0.4327)-16.4; % Transmembrane Osmotic Inlet Pressure (psi)

% Initialize Diff. EQ for Stage 1
[x,QP_1]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am,Lp,k,Q_0,pi_0),[0 1],[Q_0,dP_0]);

%% Stage 2
Q_1 = QP_1(end,1);  % Final Feed Flow Rate Value from Stage 1 (gpm)
dP_1 = QP_1(end,2); % Final Transmembrane Osmotic Inlet Pressure Value from Stage 1 (psi)
Am_2 = Am/2; % Membrane Area (ft^2)
Lp_2 = Lp; % Membrane Hydraulic Permeability (gpm/psi)
k2 = k*4; % Constant for Stage 2(psi/gpm^2)

% Initialize  Diff. EQ for Stage 2
[x2,QP_2]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am_2,Lp_2,k2,Q_0,pi_0),[1 2],[Q_1,dP_1]);

% Solve for Change in Pressure
Y = 1 - QP_2(end,1)/Q_0; 
