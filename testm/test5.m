%% Analysis: ROC

load t1.mat;
load hd.mat;

n = length(t1);
id = zeros(n,1,'int32');
for i=1:n
    id(i) = str2double(files(i).name(1:4));
end

factor = 1:n*(n-1)/2;
count=1;
for i = 1:n-1
    for j = i+1:n
        factor(count) = id(i) == id(j);
        count = count+1;
    end
end

x=0:10000/10000;
histg = hist(hd(factor==1),x);
histi = hist(hd(factor==0),x);
figure
plot(x,histg,'r');
hold on;
plot(x,histi, 'g');