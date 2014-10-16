%% Draw template and mask
load t1.mat

n=1; % 1 ~ length(t1)

template = t1{n};
mask = m1{n};
strtitle = files(n).name;

figure(1);
drawtemplate(template, mask, strtitle);

