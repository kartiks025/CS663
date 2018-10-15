function [U, S, V] = mySVD(A)
    [U, valU] = eig(A*A');
    [V, ~] = eig(A'*A);
    U = fliplr(U);
    V = fliplr(V);
    valU = rot90(valU,2);
    [m, n] = size(A);
    S = zeros(m,n);
    S(:,1:min(m,n)) = sqrt(valU(:,1:min(m,n)));
    
    X = U*S;
    Y = A*V;
    for i= 1:n
        if(Y(:,i)'*X(:,i)<0)
            U(:,i) = -U(:,i); 
        end
    end
    disp(norm(A - U*S*V'));
end