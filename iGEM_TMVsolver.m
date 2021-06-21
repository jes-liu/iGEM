function [TMV] = iGEM_TMVsolver(t,vec)

i=.25; %chance to produce viruses from infectious cell
m=2; %MOI
k=1/m; %Chance of m viruses to infect a cell
b=20; %number of viruses that burst from infected cell
g=.000017; %healthy cells growth rate   %0.024m/d
D_I=.00005; %death rate of infected cells due to necrosis, chlorosis, or stunting
D_C=.00004; %death rate of healthy cells   %per million
D_V=.1; %death rate of viruses
r=2; %replication rate of VRC
n=4; %number of viruses produced by VRC and infected cell each
a=1/m; %affinity for the cell to take VRC and become infected
p=.3;%rate at which CP and MP are used to form VRC   %5um
x=.4; %chance of virus creating CP and MP    %x+y=1
h=.0001; %chance for cell with TMV protein to undergo cell death   %per thousand
D_P=.1; %death rate of TMV proteins
% V = viruses (amount is small b/c it's constantly being used to infect)
% I = infected cells
% C = healthy cells
% W = amount of VRC; VRC contains vRNA, capsid protein (CP), movement
% protein(MP), and replicase(p50) protein
% P = VRC proteins (CP,MP,p50)

I=vec(1);
V=vec(2);
C=vec(3);
W=vec(4);
P=vec(5);

dI = k.*C.*V.^m - I.*D_I + a.*W.*C;
dV = -k.*C.*V.^m + i.*I.*n + I.*D_I.*b - x.*V - p.*V.*P + r.*W.*n - V.*D_V;
dC = -k.*C.*V.^m - a.*W.*C + g.*C - h.*C.*P - C.*D_C;
dW = p.*V.*P - W.*D_V;
dP = x.*V - p.*V.*P - h.*C.*P - P.*D_P;

TMV=[dI dV dC dW dP]';
end