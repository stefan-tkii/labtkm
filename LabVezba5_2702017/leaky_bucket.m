function leaky_bucket
clc;
clear all;
ta = [0 0.9 1.5 1.7 2.8 3.2 4.8 5.0]; % vremenski momenti na pristignuvanje
PCR = 0.5; % vrvna brzina na naiduvanje na kletkite
CDVT = 2.5; % tolerantnost na docnenjeto na kletkite
I = 1/PCR;
L = CDVT;
B(1) = 0;
LCT(1) = ta(1);
Cond(1) = B(1) - (ta(1) - LCT(1));
fprintf('%s\t\t\t%s\t\t\t%s\t\t\t%s\n', 'ta', 'B', 'LCT', 'B-(ta-LCT)');
fprintf('%f\t%f\t%f\t%f\n', ta(1), B(1), LCT(1), Cond(1));
B(2) = max(0,Cond(1))+I;
LCT(2) = ta(1);
for i=2:length(ta)
 Cond(i) = B(i) - (ta(i)-LCT(i));
 if Cond(i) > L
 B(i+1) = B(i);
 LCT(i+1) = LCT(i);
 else
 B(i+1) = max(0,Cond(i)) + I;
 LCT(i+1) = ta(i);
 end
 fprintf('%f\t%f\t%f\t%f\n', ta(i), B(i), LCT(i), Cond(i));
end
clear all;