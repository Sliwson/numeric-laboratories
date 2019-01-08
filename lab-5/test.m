v1 = [1, 1, 1, 1, 1];
v2 = [4,4,4,4,4,4];
v3 = [1,1,1,1,1];

B = rand(2);
T = [1.0001, 0;0, 2];

A = B*T*inv(B);

[v1, v2, v3] = getThreeDiagonals(A);

iterations = zeros(4,1);
lambdaApprox = 0.5;
[lambdas(1), iterations(1)] = pMethod(v1,v2,v3, lambdaApprox, 1e-6, 1e6);
[lambdas(2), iterations(2)] = pMethod(v1,v2,v3, lambdaApprox, 1e-8, 1e6);
[lambdas(3), iterations(3)] = pMethod(v1,v2,v3, lambdaApprox, 1e-10, 1e6);
[lambdas(4), iterations(4)] = pMethod(v1,v2,v3, lambdaApprox, 1e-12, 1e6);

format long;
lambdas
iterations

% v1 = [1,1,1];
% v2 = [4,4,4,4];
% v3 = [1,1,1];
% 
% A = createMatrixFromVectors(v1,v2,v3);
% 
% format long;
% 
% lambdas = zeros(4,1);
% [lambdas(1), ~] = pMethod(v1,v2,v3, 2, 1e-6, 1e6);
% [lambdas(2), ~] = pMethod(v1,v2,v3, 3, 1e-6, 1e6);
% [lambdas(3), ~] = pMethod(v1,v2,v3, 5, 1e-6, 1e6);
% [lambdas(4), ~] = pMethod(v1,v2,v3, 6, 1e-6, 1e6);
% disp(eig(A) - lambdas);