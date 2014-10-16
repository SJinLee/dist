%% Init
addpath('../VASIR')
addpath('/usr/local/lib') %opencv
dirname = '../../ICE/Left/';
files = dir([dirname '*.bmp']);

%% How to draw Iris images
% shared library can be read in matlab
% but c style functions can be exported
% this page shows how to use dll functions
loadlibrary('libvasir','test.h')

n = 4;
[c,name] = calllib('libvasir', 'readimage', [dirname files(n).name]);
reshape(c.Value.data,c.Value.hsize(2),c.Value.hsize(1));
d = transpose(c.Value.data);
clear c;
figure(1);
image(d); colormap(gray(256));
title(files(n).name);

[t,name2] = calllib('libvasir', 'createTemplate2', [dirname files(n).name]);
reshape(t.Value.template1,t.Value.hsize(2),t.Value.hsize(1));
t1 = transpose(t.Value.template1);
reshape(t.Value.mask,t.Value.hsize(2),t.Value.hsize(1));
m1 = transpose(t.Value.mask);
clear t;
figure(2)
subplot(2,1,1)
image(t1*255); colormap(gray(256));
subplot(2,1,2)
image(m1*255); colormap(gray(256));
title(files(n).name);

unloadlibrary 'libvasir'

%% CreateTemplate
loadlibrary('libvasir','test.h')
n = 5;
[c,name] = calllib('libvasir', 'readimage', [dirname files(n).name]);
reshape(c.Value.data,c.Value.hsize(2),c.Value.hsize(1));
d = transpose(c.Value.data);
clear c;
figure(3);
image(d); colormap(gray(256));
title(files(n).name);

[t,name2] = calllib('libvasir', 'createTemplate2', [dirname files(n).name]);
reshape(t.Value.template1,t.Value.hsize(2),t.Value.hsize(1));
t1 = transpose(t.Value.template1);
reshape(t.Value.mask,t.Value.hsize(2),t.Value.hsize(1));
m1 = transpose(t.Value.mask);
clear t;
figure(4)
subplot(2,1,1)
image(t1*255); colormap(gray(256));
subplot(2,1,2)
image(m1*255); colormap(gray(256));
title(files(n).name);

unloadlibrary 'libvasir'

%% Create templates
% 
% loadlibrary('libvasir','test.h')
% 
% t1 = cell(length(files),1);
% m1 = cell(length(files),1);
% for n = 1:length(files) 
%     [t,name2] = calllib('libvasir', 'createTemplate2', [dirname files(n).name]);
%     reshape(t.Value.template1,t.Value.hsize(2),t.Value.hsize(1));
%     t1{n,1} = transpose(t.Value.template1);
%     reshape(t.Value.mask,t.Value.hsize(2),t.Value.hsize(1));
%     m1{n,1} = transpose(t.Value.mask);
%     clear t;
%     fprintf('%d\n', n);
% end
% 
% unloadlibrary 'libvasir'

