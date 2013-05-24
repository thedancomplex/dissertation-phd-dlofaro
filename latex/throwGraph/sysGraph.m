D = 997.521;
%D = 997.521;
A = 85;
B = 2800;
%B = 2500;
s = tf('s');


G = D/(s^2+A*s+B);

[a,t] = step(G,0:0.0001:4);


D = 0.4/a(length(a))*D;
G = D/(s^2+A*s+B);
[a,t] = step(G,0:0.0001:4);


disp('bandwidth (rad/sec')
radsec = bandwidth(G)

disp('bandwidth (hz)')
hz = radsec/(2*pi)





hold on 
plot(t+1.018,a,'r--');

axis([0.8,1.4,-0.05, 0.42])
legend('Reference','Commanded Reference','Actual Position','2nd order model G(s)')
shg

