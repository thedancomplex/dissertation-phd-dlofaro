close all
clear all
%filename = 'RSP-Zp4-Step-Filter-Real.traj';
%filename = 'hubo-ach.log.noMovement.60sec';
filename = 'RSP-Zp4-Step-Step-Real.traj';

m = dlmread(filename, ' ');
%m2 = dlmread(filename2, ',');
T = 0.005*1000;
gmin = 0;
gmax = 1.0;

% total time
ttime = 0;
ttimea = zeros(1,11);
i = 1;

%axis([1 length(dout), min(dout)/4 max(dout)*1.5])

doStart  = m(:,1)*1000;
getRef   = m(:,2)*1000;
doFilter = m(:,3)*1000;
setPos   = m(:,4)*1000;
doCmd    = m(:,5)*1000;
getPos   = m(:,6)*1000;
getFt    = m(:,7)*1000;
getAcc   = m(:,8)*1000;
getImu   = m(:,9)*1000;
setState = m(:,10)*1000;
setSim   = m(:,11)*1000;

ddoStart = diff(doStart);
errddoStart = sum(ddoStart - T)/length(ddoStart);

plot(ddoStart);
title({sprintf('Main Loop Timing:');sprintf('Average Period = %f ms, Standard Deviation = %f', mean(ddoStart),std(ddoStart))})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(ddoStart), 4 6])
grid on
ttime = ttime + mean(ddoStart);
ttimea(i) = mean(ddoStart);
i = i +1;


% get Ref
dout = getRef - doStart;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Get Reference Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

% do Filter
dout = doFilter - getRef;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Filter Calculation Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;


% Set Pos
dout = setPos - doStart;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Set Reference Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

%doCmd
dout = doCmd - setPos;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Do Command Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

%getPos
dout = getPos - doCmd;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Get Position Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;


%getFT
dout = getFt - getPos;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Get Force-Torque Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

%getAcc
dout = getAcc - getFt;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Get Accelerometer Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

%getImu
dout = getImu - getAcc;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Get IMU Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

%setState
dout = setState - getImu;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Set State Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

%setSim
dout = setSim - setState;
dstd = std(dout);
figure
plot(dout)
title({sprintf('Set External Trigger Time:');sprintf('Average Execution Time = %f ms, Standard Deviation = %f', mean(dout),dstd)})
xlabel('sample')
ylabel('time (ms)')
axis([1 length(dout), gmin gmax])
grid on
ttime = ttime + mean(dout);
ttimea(i) = mean(dout);
i = i +1;

figure
ttimea(1) = T-sum(ttimea(2:11));
pie(ttimea,{'a','b','c','d','e','f','g','h','i','j','k'})

