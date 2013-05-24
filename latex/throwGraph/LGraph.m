clear all
close all

t = 0:0.005:3;

x = zeros(length(t),1);


figure

rr = 0.4;
r = 0;
tri = 1;

for L=1:20:400
	x = zeros(length(t),1);
	for i = 1:(length(t)-1)
		if (t(i) > tri)
			r = rr;
		else
			r = 0;
		end
		x(i+1) = (x(i)*(L-1)+r)/L;
	end
	plot(t,x);
	hold on
end

xlabel('Time (sec)');
ylabel('Angle (rad)');
title({'Reference Angle of Right Shoulder Pitch Step Response with';' Reference Filtering and Multiple L Filter Values'});

shg
