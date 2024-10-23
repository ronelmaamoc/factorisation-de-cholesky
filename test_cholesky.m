% Test de la fonction de factorisation de Cholesky

% Exemple 1 : Matrice symétrique définie positive
A1 = [4, 12, -16; 
      12, 37, -43; 
      -16, -43, 98];

% Exemple 2 : Matrice symétrique non définie positive
A2 = [1, 2; 
      2, 1]; % Cette matrice n'est pas définie positive

try
    % Appel de la fonction pour la matrice définie positive
    L1 = cholesky_factorization(A1);
    disp('Matrice définie positive A1 :');
    disp(A1);
    disp('Matrice triangulaire inférieure L :');
    disp(L1);
    
    % Vérification A1 = L1 * L1'
    disp('Vérification A1 = L1 * L1'':');
    disp(A1 - L1 * L1');
    
catch ME
    disp('Erreur lors de la factorisation de A1 :');
    disp(ME.message);
end

try
    % Appel de la fonction pour la matrice non définie positive
    L2 = cholesky_factorization(A2);
    disp('Matrice non définie positive A2 :');
    disp(A2);
    disp('Matrice triangulaire inférieure L :');
    disp(L2);
    
    % Vérification A2 = L2 * L2'
    disp('Vérification A2 = L2 * L2'':');
    disp(A2 - L2 * L2');
    
catch ME
    disp('Erreur lors de la factorisation de A2 :');
    disp(ME.message);
end
