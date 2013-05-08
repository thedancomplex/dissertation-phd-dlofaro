close all
clear all
%filename = 'RSP-Zp4-Step-Filter-Real.traj';
filenameId = 'huboCPU-idel.tex';
filenameRo = 'huboCPU-readOnly.tex';
filenameTr = 'huboCPU-traj.tex';
filenameCl = 'huboCPU-closedLoop.tex';
%filename = 'RSP-Zp4-Step-Step-Real.traj';
T = 0.1;
ra = 100:400;
sh = 3.2;
mId = dlmread(filenameId, ' ');
mId = mId(:,1);
mId = mId(ra)/2-sh;
mRo = dlmread(filenameRo, ' ');
mRo = mRo(:,1);
mRo = mRo(ra)/2-sh;
mTr = dlmread(filenameTr, ' ');
mTr = mTr(:,1);
mTr = mTr(ra)/2-sh;
mCl = dlmread(filenameCl, ' ');
mCl = mCl(:,1);
mCl = mCl(ra)/2-sh;

gmin = 4;
gmax = 13;

% total time
ttime = 0;
ttimea = zeros(1,11);
i = 1;

%axis([1 length(dout), min(dout)/4 max(dout)*1.5])

rat = ra*T;
rat = rat-min(rat);

%setSim
figure
plot(rat,mId,'r')
hold on
plot(rat,mTr,'b')
plot(rat,mRo,'g')
plot(rat,mCl,'k')
legend('Idle','Open-Loop','Read State','Closed-Loop');
title({sprintf('CPU Utilization:');sprintf('Average Idle CPU Usage = %.2f %%', mean(mId))
                                       ;sprintf('Average Open-Loop CPU Usage = %.2f %%', mean(mTr))
                                       ;sprintf('Average Read State CPU Usage = %.2f %%', mean(mRo))
                                       ;sprintf('Average Closed-Loop CPU Usage = %.2f %%', mean(mCl))})
xlabel('time (sec)')
ylabel('CPU Utilization (%)')
axis([min(rat) max(rat), gmin gmax])
grid on
