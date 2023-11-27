%data = imageToBinary('C:\Users\MED\Desktop\pal.jfif')  %sequence binaire 

data = [1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0];
L = length(data);
data_code = [];
if mod(L, 4) ~= 0
    data = [data zeros(1,4-mod(L, 4))];
end
for i = 1:4:L
    bloc = [data(i) data(i+1) data(i+2) data(i+3)];
    seq = H_encode(bloc);
    data_code = [data_code seq];
end
data = data_code;
e = 1; % Nbr de bits par seconds
[t,s] = nrz(data,e);  %gerenaration d'un code NRZ

%************************ %Modulation  : ******************************
Tb=0.1;
fc=0.8; %frequence de la porteuse 
V=1;
A=1;  
x=A.*cos(2*pi*fc*t);  %la porteuse 
BPSK_signal=x.*s; % traçage du signal modulé avec "s" est le signal NRZ

%*********************** Demodulation : *******************************

BPSK_signal_demo = BPSK_signal.*x ;
for i=0:length(BPSK_signal_demo)-1 % Reconstruction du siganl 
    if BPSK_signal_demo(i+1)<=0    %Comparaison au seuil (zeros) et regene
        mm(i+1)=-1;
        else
        mm(i+1)=1;
    end
end

% -----------------------convertir le signal recu en suite binaire---------
recd = nrz_bipolar_to_binary(t,mm);

%------------------------decodeur du Hamming-------------------------------
R = length(recd);
if recd(R) == 0
    recd(R) = [];
end
L = length(recd);
clair = [];
for i = 1:7:L
    bloc = [recd(i) recd(i+1) recd(i+2) recd(i+3) recd(i+4) recd(i+5) recd(i+6)];
    seq = H_decode(bloc);
    clair = [clair seq]
end

% -------------------
figure;
subplot(4,1,1);
plot(t,s);
xlabel('t'); 
ylabel('Amplitude');
title('Siganl non modulé')

subplot(4,1,2);
plot(t,x);
xlabel('t'); 
ylabel('Amplitude');
title('La porteuse')

subplot(4,1,3);
plot(t,BPSK_signal);
xlabel('t'); 
ylabel('Amplitude');
title('BPSK');

subplot(4,1,4);
plot(t,mm);
xlabel('t'); 
ylabel('Amplitude');
title('signal demodulé');
