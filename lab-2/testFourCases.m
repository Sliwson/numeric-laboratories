function testFourCases(f)
%TESTFOURCASES Funkcja wyswietla blad squareInterpolation dla 4 wartosci n
disp('===============TEST CASE===============');
disp(f);
[~, error] = squareInterpolation(f, 1);
D = ['n = 1: maxError: ', num2str(error)];
disp(D);

[~, error] = squareInterpolation(f, 10);
D = ['n = 10: maxError: ', num2str(error)];
disp(D);

[~, error] = squareInterpolation(f, 100);
D = ['n = 100: maxError: ', num2str(error)];
disp(D);

[~, error] = squareInterpolation(f, 200);
D = ['n = 200: maxError: ', num2str(error)];
disp(D);

end

