%% Part A, 2.)

%% Stage 1

% Given Parameters
Am = 28*7*400; % Membrane Area (ft^2)
Lp = 0.11/24/60; % Membrane Hydraulic Permeability (gpm/psi)
k = 2.12e-5; % Constant for Stage 1 (psi/gpm^2)
pi_0 = 9; % Osmotic Pressure (psi)
Q_0 = 1525; % Feed Flow Rate (gpm)
dP_0 = 40.6+360*0.433-16.4; % Transmembrane Osmotic Inlet Pressure (psi)

% Initialize Diff. EQ for Stage 1
[x,QP_1]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am,Lp,k,Q_0,pi_0),[0 1],[Q_0,dP_0]); 

%% Stage 2

% Given Parameters
Q_1 = QP_1(end,1); % Final Feed Flow Rate Value from Stage 1 (gpm)
dP_1 = QP_1(end,2); % Final Transmembrane Osmotic Inlet Pressure Value from Stage 1 (psi)
Am2 = Am/2; % Membrane Area (ft^2)
Lp2 = Lp; % Membrane Hydraulic Permeability (gpm/psi)
k2 = k*4; % Constant for Stage 2(psi/gpm^2)

% Initialize  Diff. EQ for Stage 2
[x2,QP_2]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am2,Lp2,k2,Q_0,pi_0),[1 2],[Q_1,dP_1]);

%% Graph Results 
set(gca,'DefaultAxesFontSize',20)
plot([x;x2],[QP_1(:,1);QP_2(:,1)])
xlabel('Stage')
ylabel('Retentate Flow Rate (gpm)');
set(gca,'Xtick', [0 1 2]);
hold on
plot ([0 2],[1525 1525-1234], 'o');

set(gca,'DefaultAxesFontsize',20)
plot([x;x2],[QP_1(:,2);QP_2(:,2)])
xlabel('Stage #')
ylabel('Transmembrane Pressure (psi)');
title("Pressure Drop of Retentate Flow in Stage 1 and 2")
set(gca,'Xtick', [0 1 2]);
hold on
plot ([0 1 2],180 -[0 24.9 24.9+18.2], 'o');
