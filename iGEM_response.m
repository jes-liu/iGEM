close all;clc;

t=[0:.0005:10]; %TOI = time of infection
x=[0:.0005:10]; %time of when XRN1 is agro-infiltrated into plant
initial_TMV=[0,10,10000,0,0];
initial_XRN1=[10000,21000,0,21000,1];

[t,vec] = ode15s(@iGEM_TMVsolver,t,initial_TMV);
[x,agro] = ode15s(@iGEM_XRN1solver,x,initial_XRN1);

I=vec(:,1);
V=vec(:,2);
C=vec(:,3);
W=vec(:,4);
P=vec(:,5);
IX=agro(:,1);
VX=agro(:,2);
CX=agro(:,3);
WX=agro(:,4);
X=agro(:,5);

figure(1)
subplot(2,1,1)
hold on
plot(t,I,'linewidth',3)
plot(t,V,'k','linewidth',3)
plot(t,C,'linewidth',3)
plot(t,W,'linewidth',3)
title('N. Benthamiana with TMV')
legend('Infected','Virus','Cells','VRC','location','best')
xlabel('Time(dpi)')
ylabel('Concentration in 1000s')
ylim([0 22000])
subplot(2,1,2)
plot(t,P,'g','linewidth',3)
title('TMV proteins')
xlabel('Time(dpi)')
ylabel('Concentration in 1000s')
hold off
figure(2)
subplot(2,1,1)
hold on
plot(x,IX,'linewidth',3)
plot(x,VX,'linewidth',3)
plot(x,CX,'linewidth',3)
title('Infected N. Benthamiana with XRN1')
legend('Infected','Virus and VRC','Cells','location','best')
xlabel('Time(dpi)')
ylabel('Concentration in 1000s')
ylim([0 22000])
subplot(2,1,2)
plot(x,X,'g','linewidth',3)
title('XRN1')
xlabel('Time(dpi)')
ylabel('Concentration in 1000s')
hold off