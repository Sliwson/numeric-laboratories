%duza macierz (100x100)
sizes = [5,25,100,500];

for i=1:4
    A = generateSquareMatrix(sizes(i), 0.97, 1, 10, 0);
    b = 0.5 - rand(sizes(i),1);

    A = matrixToSparse(A);

    bestk = 1e5;
    bestw = 0;

    for w=0.02:0.02:1.98
        [x,k] = sorSparse(A,b,w, zeros(sizes(i),1), 10e-8, 10e4);
        if(k < bestk)
            bestk = k;
            bestw = w;
        end
    end

    D = ['Dla rozmiaru: ', int2str(sizes(i)), ' najlepsze w: ', int2str(bestw), ', liczba iteracji: ', int2str(bestk)];
    disp(D);
end