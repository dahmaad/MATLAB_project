function Clair_seq = H_decode(recd)
    n = 7;
    k = 4;
    A = [ 1 1 1;1 1 0;1 0 1;0 1 1 ];
    H = [ A' eye(n-k) ];
% DECODER%
syndrome = mod(recd * H',2);
%Find position of the error in codeword (index)
find = 0;
for ii = 1:n
    if ~find
        errvect = zeros(1,n);
        errvect(ii) = 1;
        search = mod(errvect * H',2);
        if search == syndrome
            find = 1;
            index = ii;
        end
    end
end
disp(['Position of error in codeword=',num2str(index)]);
correctedcode = recd;
correctedcode(index) = mod(recd(index)+1,2); %Corrected codeword
%Strip off parity bits
msg_decoded=correctedcode;
Clair_seq = msg_decoded(1:4);