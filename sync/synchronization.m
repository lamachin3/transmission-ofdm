clear all;

data = load('samples.mat');
Md = [];
L = 32;
delta_f = [];

for d=1:size(data.samples3)-2*L
    Pd = 0;
    Rd = 0;
    for m=1:32
        Pd = Pd + data.samples3(d+m+L) * conj(data.samples3(m+d));
        Rd = Rd + abs(data.samples3(d+m+L)) * abs(data.samples3(d+m+L));
    end
    Md = [Md (abs(Pd) * abs(Pd)) / (Rd * Rd)];
    
    phase = angle(Pd);
    delta_f = [delta_f phase/(pi * 50e-9)];
end

stem(Md);
figure;
stem(delta_f);