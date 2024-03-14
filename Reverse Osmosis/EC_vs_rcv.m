%% Part B, 3.)
function EC_vs_rcv()
Y = zeros(1,10); % Energy Consumption
Q_0 = zeros(1,10); % Feed Flow (gpm)
H = zeros(1,10); % Pump Head (ft.)
rcv = zeros(1,10); % Recovery Percentage
pi_0 = 9; % Feed Osmotic Pressure (psi)


for i = 1:10
   rcv(i) = 0.76+0.02*i; % Percent Recovery
   Q_0(i) = 1234/rcv(i); % Feed Flow (gpm)
   H(i) = fsolve(@(H)Calc_H(H,Q_0(i),rcv(i)),180); % Pump Head (ft.)
   Y = Calc_RO_Y(Q_0(i),H(i)); % Energy Consumption
end

EC = Q_0.*H./(1234.*pi_0); % Energy Consumption

set(gca,'DefaultAxesFontSize',20)
plot(rcv,EC)
xlabel('Pump Recovery')
ylabel('Energy Consumption');
set(gca,'Xtick', [0 1 2]);
hold on
plot ([0 1 2],180 -[0 24.9 24.9+18.2], 'o');

end 
