clc
close all
clear variables

fs = 2^13;
T = 0.5;
piano.envelope = @(t) min(40*t,1).*exp(-4*t);
piano.harmonics = [0.6 0.2];
 
mary2;


w0 = tone2(fs,script(1),piano);
sound(w0,fs);
t_init= tic;
for i = 2:length(script)
    wi = tone2(fs,script(i),piano);
    while toc(t_init) < script(i).duration 
    end
    sound(wi,fs);
    t_init = tic;
end

