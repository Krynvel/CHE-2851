%% Part A, 2.)
Am = 28*7*400; % Membrane Area (ft^2)
Lp = 0.11/24/60; % (gallon per ft^2 per min/per psi)
k = 2.12e-5; % (psi/gpm^2)
pi_0 = 9; % Feed Osmotic Pressure (psi)

%% Stage 1
Q_0 = 1525; % Feed Flow (gpm)
dP_0 = 40.6+360*0.433-16.4; % Transmembrane Inlet Pressure (psi)
[x,QP_1]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am,Lp,k,Q_0,pi_0),[0 1],[Q_0,dP_0]); 

%% Stage 2
Q_1 = QP_1(end,1); % Calls final value from Stage 1
dP_1 = QP_1(end,2); % Calls final value from Stage 1
Am2 = Am/2; % Membrane Area (ft^2)
Lp2 = Lp; % (gallon per ft^2 per min/per psi)
k2 = k*4; % (psi/gpm^2)
[x2,QP_2]=ode45(@(x,QP_1)RO_model_fxn(x,QP_1,Am2,Lp2,k2,Q_0,pi_0),[1 2],[Q_1,dP_1]);

%% Graph
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
set(gca,'Xtick', [0 1 2]);
hold on
plot ([0 1 2],180 -[0 24.9 24.9+18.2], 'o');
