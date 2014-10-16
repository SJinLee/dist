function [ hd ] = getdistance( t1, m1, t2, m2 )
% t1 : gallery template
% m1 : gallery mask
% t2 : probe template
% m2 : probe mask
% hd : hamming distance

maxShiftX = 5;
maxShiftY = 1;
hd = 1;

for ys = 0:maxShiftY
    for xs = -maxShiftX:maxShiftY
        ts = circshift(t2,[-xs,-ys]);
        ms = circshift(m2,[-xs,-ys]);
        ts(end,:) = ones(1,size(ts,2));
        ms(end,:) = ones(1,size(ms,2));
        mask = m1 & ms;
        diff = xor(t1,ts) & ms;
        hd1 = sum(sum(diff)) / sum(sum(mask));
        if (hd1 < hd)
            hd = hd1;
        end
    end
end

hd;

end

