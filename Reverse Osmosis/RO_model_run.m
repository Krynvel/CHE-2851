Am = 28*7*400; %% membrane area in sqft
Lp = 0.11/24/60; %% gallon per sqft per min per psi
k = 2.12e-5; %% psi/gpm2
pi0 = 9; %% feed osmotic pressure in psi

%% Stage 1
Q0 = 1525; %% gpm
DP0 = 40.6+360*0.433-16.4;
[x,QP1]=ode45(@(x,QP)RO_model(x,QP,Am,Lp,k,Q0,pi0),[0 1],[Q0,DP0]);

%% Stage 2
Q1 = QP1(end,1); % Calls final value from Stage 1
DP1 = QP1(end,2); % Calls final value from Stage 1
Am2 = Am/2;
Lp2 = Lp;
k2 = k*4;
[x2,QP2]=ode45(@(x,QP)RO_model_fxn(x,QP,Am2,Lp2,k2,Q0,pi0),[1 2],[Q1,DP1]);

%% Graph
set(gca,'DefaultAxesFontSize',20)
plot([x;x2],[QP1(:,1);QP2(:,1)])
xlabel('Stage')
ylabel('Retentate flow rate (gpm)');
set(gca,'Xtick', [0 1 2]);
hold on
plot ([0 2],[1525 1525-1234], 'o');

set(gca,'DefaultAxesFontsize',20)
plot([x;x2],[QP1(:,2);QP2(:,2)])
xlabel('Stage')
ylabel('Transmembrane pressure (psi)');
set(gca,'Xtick', [0 1 2]);
hold on
plot ([0 1 2],180 -[0 24.9 24.9+18.2], 'o');
