function Ham_seq = H_encode(data_bloc)
    n = 7; % longeur de mot de code
    k = 4; % longeur de code 
    A = [ 1 1 1;1 1 0;1 0 1;0 1 1 ]; % matrice de controle
    G = [ eye(k) A ]; % matrice generatrice
    Ham_seq = mod(data_bloc*G,2);