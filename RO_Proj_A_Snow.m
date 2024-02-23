PVpTrain = 42;
1stSPV = 28;
2ndSPV = 14;
mePV = 7;
A = 400;'ft^2'
P_0 = 40.6;'psi'
deltapi_0 = 9;'psi'
Q_f = 1525;'gpm'
P_p = 16.4;'psi'
Q_p = 1234;'gpm'
deltaP_r1 = 24.9;'psi'
deltaP_r2 = 18.2;'psi'
H = 360;'ft'

k = 2.12*10e-5;
L_p = 0.11; 'gfd/psi'

x_0 = 0;

[Q(x),x] = ode45 (@stg1_Q, Q(x), x_0);
[deltaP(x),x] = ode45(@stg1_P, deltaP(x), x_0);

[Q(x),x] = ode45 (@stg2_Q, Q(x), x_0);
[deltaP(x),x] = ode45(@stg2_P, deltaP(x), x_0);


