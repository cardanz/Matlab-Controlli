%pulizia schermo e memoria
clear;
clf;
%definisco zeri e poli della G(S)
zeri =[1000];
poli =[-1000, -100];
% calcolo i polinomi derivanti 
num = poly(zeri);
den = poly(poli);
k=1;
fdt = zpk(zeri,poli,k);
%calcolo la fdt in forma di bode
%perchè sia zpk che bode_as vogliono la forma di Evans
fdt.DisplayFormat = 'frequency';
%da cui ottengo k = -100;
%print per corrispondenza con bode a spezzate
G = zpk(zeri,poli,-100);
G.DisplayFormat = 'frequency';
bode_asymptotic(-100*num,den);
zeriRegolatore = [-100];
poliRegolatore = [0];
% guad in forma di evans
Kr = 1.5;
R = zpk(zeriRegolatore,poliRegolatore,Kr);
%avvio control System des. e valuto la correttezza del tutto 
controlSystemDesigner(G);

%da riga di comando valuto le prestazioni :
% stepinfo(IOTransfer_r2y)
% stepinfo(IOTransfer_r2y,'settlingTimeThreshold',0.05)
% ricordare discorso di minpoly se no non vedi la cancellzazione zero polo 