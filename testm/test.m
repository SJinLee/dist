%% Init
addpath('~/VASIR/VASIR')
addpath('/usr/local/lib')
files = dir('../ICE/Left/*.bmp');

%% How to draw Iris images
% shared library can be read in matlab
% but c style functions can be exported
% this page shows how to use dll functions
loadlibrary('libvasir','test.h')

n = 4;
[c,name] = calllib('libvasir', 'readimage', ['../ICE/Left/' files(n).name]);
reshape(c.Value.data,c.Value.hsize(2),c.Value.hsize(1));
d = transpose(c.Value.data);
clear c;
figure(1);
image(d); colormap(gray(256));
title(files(n).name);

[t,name2] = calllib('libvasir', 'createTemplate2', ['../ICE/Left/' files(n).name]);
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
[c,name] = calllib('libvasir', 'readimage', ['../ICE/Left/' files(n).name]);
reshape(c.Value.data,c.Value.hsize(2),c.Value.hsize(1));
d = transpose(c.Value.data);
clear c;
figure(3);
image(d); colormap(gray(256));
title(files(n).name);

[t,name2] = calllib('libvasir', 'createTemplate2', ['../ICE/Left/' files(n).name]);
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

%% Function List
% 
% loadlibrary('libvasir','test.h')
% libfunctionsview libvasir
% unloadlibrary 'libvasir'


