function dual_leaky_bucket
clc;
clear all;
ta = [1 2 3 4 5 6 7 8 9 10]; 
PCR = 0.5; 
SCR=0.25;
MBS=4;
CDVT = 1; 
Ip = 1/PCR;
Lp = CDVT; %1
Is = 1/SCR;
BT = (MBS-1)*(1/SCR - 1/PCR);
Ls = BT + CDVT; %7
Bp(1) = 0;
Bs(1)=0;
LCT(1) = ta(1);
Condp(1) = Bp(1) - (ta(1) - LCT(1));
Conds(1) = Bs(1) - (ta(1) - LCT(1));
fprintf('%s\t\t\t%s\t\t\t%s\t\t\t%s\t\t\t%s\t\t\t%s\n', 'ta', 'Bs', 'Bp', 'LCT', 'Bs-(ta-LCT)', 'Bp-(ta-LCT)');
fprintf('%f\t%f\t%f\t%f\t%f\t%f\n', ta(1), Bs(1), Bp(1), LCT(1), Conds(1), Condp(1));
Bs(2) = max(0, Conds(1))+Is;
Bp(2) = max(0, Condp(1))+Ip;
LCT(2) = ta(1);
for i=2:length(ta)
 Conds(i) = Bs(i) - (ta(i)-LCT(i));
 Condp(i) = Bp(i) - (ta(i)-LCT(i));
 if Conds(i) > Ls || Condp(i) > Lp
 Bs(i+1) = Bs(i);
 Bp(i+1) = Bp(i);
 LCT(i+1) = LCT(i);
 else
 Bs(i+1) = max(0,Conds(i)) + Is;
 Bp(i+1) = max(0,Condp(i)) + Ip;
 LCT(i+1) = ta(i);
 end
 fprintf('%f\t%f\t%f\t%f\t%f\t%f\n', ta(i), Bs(i), Bp(i), LCT(i), Conds(i), Condp(i));
end
clear all;