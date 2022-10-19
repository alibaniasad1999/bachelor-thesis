clc
clear all

x0	= 1;
global A B Q R n R_inv
A = [0 1
	 0 0];
B = [0
	 1];
Q	= 20*eye(2);
R	= 1;
R_inv = 1;
H	= 10*eye(2);
tf	= 25;

K0	= [H,[0, 0]'];
n	= 2;
k0	= reshape(K0,n + n^2,1);

global t_K K_arr
[t_K,K_arr] = ode45(@diff_eq_Riccati,[tf,0],k0);

figure(100)
hold on
plot(t_K,K_arr)
legend 'show'


t = 0:0.05:tf;
K_arr_n	= interp1(t_K, K_arr, t);

K = K_arr_n(:, 1:4);
S = K_arr_n(:, 5:end);

sig = struct('values', fliplr(S')');
data = struct('time', t, 'signals', sig);

K1 = K(1, 1);
K2 = K(1, 2);
amplitude_1 = max(K(:, 3)); % K3 amplitude sin wave
K4 = K(1, 4);

S1 = S(1, 1);
amplitude_2 = max(S(:, 2)); % S2 amplitude sin wave



%%

function d = diff_eq_Riccati(t,ks)
global A B Q R_inv n
ks	= reshape(ks, n + 1,n);
K	= ks(1:n, :);
s   = ks(n+1: end, :)';
Kdot	= -K*A - A'*K - Q + K*B*R_inv*B'*K;
r = [0; sin(t)];
s_dot = -A'*s + K*B*R_inv*B'*s + Q*r;
d	= reshape([Kdot, [0;0]],n + n^2,1);

end


