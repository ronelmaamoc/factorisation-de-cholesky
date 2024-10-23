function L = cholesky_factorization(A)
    % Appel de la fonction chol_custom pour vérifier la positivité définie
    [L, p] = chol_custom(A);
    if p ~= 0
        error('La matrice n''est pas définie positive.');
    end
end

function [L, p] = chol_custom(A)
    % Vérifie si la matrice est symétrique
    if ~isequal(A, A')
        error('La matrice doit être symétrique.');
    end

    % Taille de la matrice
    n = size(A, 1);
    L = zeros(n, n);
    p = 0; % Indicateur pour la positivité définie, 0 si définie positive, sinon 1

    % Tentative de factorisation de Cholesky manuelle
    for i = 1:n
        for j = 1:i
            if i == j
                % Calcul de l'élément diagonal
                temp_sum = sum(L(i, 1:j-1).^2);
                diagonal_element = A(i, i) - temp_sum;
                if diagonal_element <= 0
                    % Si l'élément diagonal n'est pas positif, la matrice n'est pas définie positive
                    p = 1;
                    return;
                end
                % Affecter la racine carrée de l'élément diagonal
                L(i, j) = sqrt(diagonal_element);
            else
                % Calcul des éléments hors diagonale
                L(i, j) = (A(i, j) - sum(L(i, 1:j-1) .* L(j, 1:j-1))) / L(j, j);
            end
        end
    end
end
