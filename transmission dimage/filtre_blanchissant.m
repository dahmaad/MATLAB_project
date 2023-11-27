Tb=0.1; 
f= -1/Tb:0.01:1/Tb; %génération de vecteur de fréquence
%cosinus surélevé : 
Cos_slv=cosinus_surelve(0.5);
%l'inverse de fonction sinc :  (fonction de mise en forme de filtre du
%codeur en ligne)
Sin_inv=(pi*f)./sin(pi*f*Tb);

%filtre blachissant : 
F_blan=Sin_inv.*Cos_slv; %traçage du filtre blachissant 


figure;
title('filtre blanchiassnt :');
xlabel('Frequence(Hz)');
ylabel('Amplitude');
plot(f,F_blan,'LineWidth',3)