clc
close all
clear variables

fs = 2^13;
T = 0.5;
mary;
w = tone(fs, script(1));
w = [w; tone(fs,script(2))];
w = [w; tone(fs,script(3))];
w = [w; tone(fs,script(4))];
w = [w; tone(fs,script(5))];
w = [w; tone(fs,script(6))];
w = [w; tone(fs,script(7))];
w = [w; tone(fs,script(8))];
w = [w; tone(fs,script(9))];
w = [w; tone(fs,script(10))];
w = [w; tone(fs,script(11))];
w = [w; tone(fs,script(12))];
w = [w; tone(fs,script(13))];

sound(w,fs);


