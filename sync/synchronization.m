clear all;

data = load('samples.mat');
Md = [];
L = 32;

for d=1:size(data.sample1)-2*L
    Pd = 0;
    Rd = 0;
    for m=1:32
        Pd = Pd + data.samples1(d+m+L) * conj(data.samples1(m+d));
        Rd = Rd + abs(data.samples1(d+m+L)) * abs(data.samples1(d+m+L));
    end
    Md = [Md (abs(Pd) * abs(Pd)) / (Rd * Rd)];
end
