g = 9.81;
H = 17000;
R = 6371000;
v_true = sqrt(g*H);
t=linspace(0,24,49);
t1=linspace(0,86400,49);
data = readlines('24hours.txt');
xm=zeros(49,1);
xd=zeros(49,1);
x90= (R*(pi/2))*ones(49,1);
v=zeros(48,1);
vgh = sqrt(9.81*17000)*ones(48,1);
x_true=zeros(49,1);
for i=1:49
    theta=str2num(data(i));
    xd(i)=rad2deg(theta);
    xm(i)=R*theta;
end
for i=1:48
	v(i)=abs(xm(i+1)-xm(i))/1800;
end
ninedeg = R*(pi/2);
wavavg=diff(xm)./diff(t1);
tavg=(t1(1:end-1)+t1(2:end))/2;
figure;
plot(t,xm,'b.-',MarkerSize=25);
hold on;
plot(t,x90,'Color',[0.1,0.1,0.1]);
plot(6.77,ninedeg,'g.',MarkerSize=25);
plot(20.39,ninedeg,'m.',MarkerSize=25);
title("Wave Position");
ylabel("Distance (meters)");
xlabel("Time: (hours)");
legend("Numerical Solution","Half Way Point","6.8 hours", "20.4 hours");
set(gcf,'position',[50,50,700,580])
figure;
plot(tavg,wavavg,'b.-','MarkerSize',25);
%plot(xd(2:28),v(1:27),'b*-')
%hold on;
%plot(xd(29:49),v(28:48),'g*-')
%plot(xd(2:49),vgh,'r-');
%plot(xd(28:29),v(27:28),'g-')
title("Wave Velocity");
xlabel("Time (seconds)");
yl=ylabel(["Velocity", "$$\left(ms^{-1}\right)$$"]);
legend("Wave Velocity");
set(yl,'Interpreter','latex');
%set(leg,'Interpreter','latex');