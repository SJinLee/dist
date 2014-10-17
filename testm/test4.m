%% calculate HD distance matrix
load t1.mat

n = length(t1);

hd = zeros(n*(n-1)/2,1,'double');
count = 1;
for i = 1:(n-1)
    for j = (i+1):n
        hd(count) = getdistance(t1{i},m1{i},t1{j},m1{j});
        count = count + 1;
    end
    fprintf('i=%d/%d\n',i,n);
end
        
save('hd.mat','hd');