close all;
Fe = 320000; 
Tsim = 0.1;  
Te=1/Fe; 
T=1/5000; %PGCD des fréquences 
M=T/Te;
Fsin1 = 85000; %Fsin doit etre inférieur à Fe/2 
Fsin2 = 90000; 
Fsin3 = 94986.8; 
Fsin4 = 100000; 
Fsin5 = 115015.9; 
Fsin6 = 120000;
Res=sim('SimLaserGame');  
plot(Res.Sinus_Echanti);
hold on;
plot(Res.Sinus_Echanti,'o');
figure;
tab = Res.Sinus_Echanti.data;
%for i = 1:32 
  %  tab(i)=0;
%end
X=linspace(0,M-1,M)*1/T %signal harmonique les fréquences impaires 1,3,5 a partir la frequence ne verifie plus shanon filtre de repliement pour supprimer les frequences trop grandes c a d que a partir de ce signal carré on va le transformer en sinus en gros

plot(X,abs(fft(tab,M)/M),'o'); 
figure; 
X=linspace(0,M-1,M)*1/T
semilogy(abs(fft(Res.Sinus_Echanti.data,M)/M),'o'); 
num=1; 
den=[1.7483*10^(-23) 7.6663*10^(-18) 1.162*10^(-11) 3.0332*10^(-6) 1];
F=tf(num,den);  
figure;
bode(num,den);




