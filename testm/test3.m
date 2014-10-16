%% Distance

load t1.mat

n=4;
m=5;

hd = getdistance(t1{n},m1{n},t1{m},m1{m});
fprintf('dist=%f\n',hd);
