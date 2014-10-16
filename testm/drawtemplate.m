function drawtemplate( t1, m1, strtitle)
% t1 : template
% m1 : mask
% f1 : figure number
% strtitle : title

subplot(2,1,1)
image(t1*255); colormap(gray(256));
name = strrep(strtitle,'_','\_');
title(name);
subplot(2,1,2)
image(m1*255); colormap(gray(256));

end
