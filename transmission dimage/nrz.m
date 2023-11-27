function [t,x] = nrz(bits, e)

T = length(bits)/e; % longeur de tout la sequence de bits
                    % e =Nbr de bits par seconds
                    % bits = sequence de bits 
n = 1000; 
N = n*length(bits);
dt = T/N;  
t = 0:dt:T; 
x = zeros(1,length(t)); % signal de sortie

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1:(i+1)*n) = 1;
  else
    x(i*n+1:(i+1)*n) = -1;
  end
end

