clear all;

data = load('samples.mat');
Md = [];
Mf = [];
delta_f = [];

L = 32;
k = 0;
Ng = 2;

for d=1:size(data.samples3)-2*L
    Pd = 0;
    Rf = 0;
    
    for m=1:2*L
        if m<=L
            Pd = Pd + data.samples3(d+m+L) * conj(data.samples3(m+d));
        end
        Rf = Rf + 0.5 * abs(data.samples3(d+m))^2;
    end

    Mf = [Mf (abs(Pd)^2)/(Rf^2)];
    if d>2
        Mf_moy = 0;
        
        for k=-Ng:0
            Mf_moy = Mf_moy + (1/(Ng+1)) * Mf(d+k);
        end
        
        if Mf_moy > 0.998 && Mf_moy < 1.002
            phase = angle(Pd);
            delta_f = [delta_f phase/(pi * 64 * 50e-9)];
        end
        
        Md = [Md Mf_moy];
    end
end
    
stem(Md);
figure;
stem(delta_f);