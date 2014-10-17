%% Draw template and mask
load t1.mat

n=1; % 1 ~ length(t1)

template = t1{n};
mask = m1{n};
strtitle = files(n).name;

figure(1);
drawtemplate(template, mask, strtitle);

%%
nimgs=10;
start = 1;
for i=1:nimgs
    subplot(2*nimgs,1,2*i-1)
    image(t1{i+start-1}*255); colormap(gray(256));
    name = strrep(files(i+start-1).name,'_','\_');
    title(name);
    subplot(2*nimgs,1,2*i)
    image(m1{i+start-1}*255); colormap(gray(256));
end

