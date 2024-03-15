%% Part B, 3.)

function Y = Calc_RO_EC()

% Given Parameters
Y = zeros(1,10); % Flow Pressure (psi)
Q_0 = zeros(1,10); % Feed Flow (gpm)
H = zeros(1,10); % Pump Head (ft)
rcv = zeros(1,10); % Recovery Percentage (%)
pi_0 = 9; % Feed Osmotic Pressure (psi)

% Iteration to Solve for Percent Recovery and Pump Head
options = optimset('TolFun',1e-10,'TolX',1e-10,'Display','off');
for i = 1:10
   rcv(i) = 0.76+0.02*i; % Percent Recovery (%)
   Q_0(i) = 1234/rcv(i); % Feed Flow Rate (gpm)
   H(i) = fsolve(@(H)Calc_H(H,Q_0(i),rcv(i)),360, options); % Pump Head (ft)
   Y = Calc_RO_Y(Q_0(i),H(i)); % Flow Pressure (psi)
end

% Solve for Pump Energy Consumption (Neglecting Efficiency)
EC = Q_0.*H./(1234.*pi_0); % Energy Consumption

% Graph Results
set(gca,'DefaultAxesFontsize',20)
plot(rcv,EC,"LineStyle","-","Color","b","Marker","o","MarkerEdgeColor","r")
xlabel('Pump Recovery')
ylabel('Energy Consumption');
title ("Energy Consumption vs. Recovery ")
end 
