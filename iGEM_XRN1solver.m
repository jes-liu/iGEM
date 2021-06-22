function[XRN1] = iGEM_XRN1solver(x,agro)

D_I=.00005; %death rate of infected cells due to necrosis, chlorosis, or stunting
D_C=.00004; %death rate of healthy cells   %per million
D_V=.1; %death rate of viruses
b=20; %number of viruses that burst from infected cell
c=2; %rate of curing infected cell
e=2; %rate of healthy cell produing XRN1
v=3; %rate of degrading viruses
D_X=.1; %death rate of XRN1
% X = XRN1

I=agro(1);
V=agro(2);
C=agro(3);
W=agro(4);
X=agro(5);

dIX = -c.*I.*X - I.*D_I;
dVX = -v.*X + I.*D_I.*b - V.*D_V;
dCX = c.*I.*X - C.*D_C;
dWX = -v.*X - W.*D_V;
dX = e.*C - X.*D_X - c.*I.*X - v.*X;

[XRN1] = [dIX dVX dCX dWX dX]';