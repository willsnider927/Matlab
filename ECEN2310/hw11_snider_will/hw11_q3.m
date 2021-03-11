clc
close all
clear variables

fs = 2^13;
T = .5;

pure.envelope = @(t) 1;
pure.harmonics = [0.6 0.2];
note.duration = T;
note.semitone = {'A'};
note.octave = 0;

figure(1)
w = tone2(fs,note,pure);
W = fft(w/length(w));
freq = 0:1/T:fs-1/T;
stem(freq,W);

figure(2)
note.semitone = {'E'};
w = tone2(fs,note,pure);
W = fft(w/length(w));
freq = 0:1/T:fs-1/T;
stem(freq,W);

figure(3)
stem(freq,W);
hold on
w = toneF(fs,note,pure);
W = fft(w/length(w));
freq = 0:1/T:fs-1/T;
stem(freq,W,'r');
hold off

mary2;

figure(4)
w = toneF(fs,script(2),pure);
W = fft(w/length(w));
freq = 0:1/T:fs-1/T;
stem(freq,W)

