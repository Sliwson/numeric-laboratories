A=[1,1,1,2,2,2,3,3,3;1,2,3,1,2,3,1,2,3;3,-1,1,-1,3,-1,1,-1,3];
b = [-1;7;-7];
w = 1.25;
xFirst = [0;0;0];
tolerance = 10e-6;
maxIterations = 1e5;

disp("answer:");
disp(sorSparse(A,b,w,xFirst,tolerance,maxIterations));