clear;
clc;
%Vypocet casu
U0 = 12;
%chci cas pro 2 V v nasobcich tau
uc = 4;
U = U0 - uc; %rozdil napeti vuci minimu na kondenzatoru
Ktau = -log((U - uc)/U);

K = 2^(1/4);
%ucTon je pro 440 Hz (komorni A)
Tpul = 1/440/2/K;
Tau = Tpul/Ktau;
C = 10e-9;
R= Tau/C;
f1 = 1/Tpul/2;
f2 = f1*2^(-1/12);
f3 = f2*2^(-1/12);
f4 = f3*2^(-1/12);

%chci napeti pro pulton, ton
ucPulTon = U*(1-exp(-(1/f2-Tpul)/Tau))+uc;
ucTon = U*(1-exp(-(1/f3-Tpul)/Tau))+uc;
uc1aPulTon = U*(1-exp(-(1/f4-Tpul)/Tau))+uc;

%chci vnitrni odpor delice pro jednu diodu se seriovym oodporem R1
%odpovida tonu
Udiod = 1.2;
Upoc = 2*uc;
R3 = 1500;
pa = (ucTon-Upoc)/(U0-Upoc-Udiod);
pb = (ucPulTon-Upoc)/(U0-Upoc-Udiod);
pc = (uc1aPulTon-Upoc)/(U0-Upoc-Udiod);
R4 = (1-pb)*pa*R3/(1-pa)/pb;
Ri = R3*R4/(R3+R4);
Ri = pc*Ri/(1-pc);
Rd1 = U0*Ri/ Upoc;
Rd2 = 1/(1/Ri - 1/Rd1);
