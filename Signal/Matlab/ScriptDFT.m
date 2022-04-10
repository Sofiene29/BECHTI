close all;
T = 0.25;
M=32;
Te = T/M;
Tsim = T-Te; 
Fsin = 60;    %Fsin doit etre inférieur à Fe/2
Res=sim('SimulDFT'); 
plot(Res.Sinus_Continu);
hold on;
plot(Res.Sinus_Echanti,'o');
figure;
plot(abs(fft(Res.Sinus_Echanti.data,M)/M)); 
x=linspace(0,31,32);  
figure; 
plot(x,abs(fft(Res.Sinus_Echanti.data,M)/M),'o');  
z=x*(1/T);  
figure;
plot(z,abs(fft(Res.Sinus_Echanti.data,M)/M),'o');




