%% Analysis : ROC
load t1.mat

n = length(t1);
id = zeros(n,1,'int32');
for i=1:n
    id = str2double(files(i).name(1:4));
end

hd = zeros(n*(n-1)/2,1,'double');
count = 1;
for i = 1:(n-1)
    for j = (i+1):n
        hd(count) = getdistance(t1{i},m1{i},t1{j},m1{j});
    end
    fprintf('i=%d/%d\n',i,n);
end
        
        