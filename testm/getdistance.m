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
        if ys > 0
            ts(end-ys+1:end,:) = ones(1:ys,size(ts,2));
            ms(end-ys+1:end,:) = ones(1:ys,size(ms,2));
        end
        nmask = ~(m1 | ms);
        diff = xor(t1,ts) & nmask;
        hd1 = sum(sum(diff)) / sum(sum(nmask));
        if (hd1 < hd)
            hd = hd1;
        end
    end
end

hd;

end

