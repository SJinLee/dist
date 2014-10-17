%% Analysis: ROC

load t1.mat;
load hd.mat;

n = length(t1);

%% group id: genuine==1, imposter==0
group = 1:n*(n-1)/2;
count=1;
for i = 1:n-1
    for j = i+1:n
        group(count) = files(i).name(1:4) == files(j).name(1:4);
        count = count+1;
    end
end

%% distribution
x=0:10000/10000;
histg = hist(hd(group==1),x);
histi = hist(hd(group==0),x);
figure
plot(x,histg,'r');
hold on;
plot(x,histi, 'g');

%% ROC
cumg = cumsum(histg);
cumi = cumsum(histi(end:-1:1));
cumi = cumi(end:-1:1);
from = find(cumi>0,'first');
to = find(cumg>0,'last');
EER = cumg(find(cumg<cumi,'first'));
NER3 = cumg(find(cumi<0.001,'last'));
fprintf('EER=%f,NER3=%f\n',EER,NER);
figure
loglog(cumg(from:to),cumi(from:to));