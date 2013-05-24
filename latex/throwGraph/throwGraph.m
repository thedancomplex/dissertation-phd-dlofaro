close all
clear all
%filename = 'RSP-Zp4-Step-Filter-Real.traj';
filename = 'walkFiveSteps0p2m.traj';
%filename = 'RSP-Zp4-Step-Step-Real.traj';
T = 0.005;


m = dlmread(filename, ' ');
sm = size(m);

t = 1:sm(1);
t = t*T;


%getAcc   = m(:,8)*1000;

plot(t,m)
xlabel('time (sec)')
ylabel('position (rad)')
title({'5 step joint space ZMP walking trajectory with step length of 0.2m'})
grid on
legend('RHY', 'RHR', 'RHP', 'RKN', 'RAP', 'RAR', 'LHY', 'LHR', 'LHP', 'LKN', 'LAP' ,'LAR', 'RSP', 'RSR', 'RSY', 'REB' ,'RWY', 'RWR', 'RWP', 'LSP', 'LSR', 'LSY', 'LEB', 'LWY', 'LWR', 'LWP', 'NKY', 'NK1', 'NK2', 'WST')
