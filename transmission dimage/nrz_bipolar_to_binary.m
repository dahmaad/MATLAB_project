function binary = nrz_bipolar_to_binary(t,x)
    n = 1000;
    % signal est un vecteur de nombres réels représentant un signal NRZ bipolaire
    binary = []; % variable pour stocker la suite binaire
    for i = 1:n:length(t) % parcourir le vecteur du signal
      if x(i) == 1 % cas du premier élément
        binary = [binary 1]; % on ajoute un 1 arbitrairement
      else % cas des éléments suivants
        binary = [binary 0]; % on ajoute un 0
      end
    end
    end