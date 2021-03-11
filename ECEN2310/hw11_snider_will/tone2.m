function w = tone2(fs, note, instrument)
oct = note.octave;
T = note.duration;
w = [];
for i = 1:size(note.semitone)
switch note.semitone{i}
    case 'A' 
        smt = 0;
    case 'A#' 
        smt = 1;
    case 'B' 
        smt = 2;
    case 'C'
        smt = 3;
    case 'C#'
        smt = 4;
    case 'D'
        smt = 5;
    case 'D#' 
        smt = 6;
    case 'E' 
        smt = 7;
    case 'F'
        smt = 8;
    case 'F#'
        smt = 9;
    case 'G'
        smt = 10;
    case 'G#' 
        smt = 11;
    case'-1'
        smt = 12;
end
t = 1/fs:1/fs:T;
f = 2*pi*440 * 2^(oct(i)) * 2^(smt/12);
k = sin(f*t);

if nargin == 2
    w = [w k];
end

if nargin == 3
    j = k+instrument.harmonics(1)*sin(2*f*t)+instrument.harmonics(2)*sin(f*t*3);
    l = j.*instrument.envelope(t);
    w = [w l];
end
end

if smt == 12
    w = zeros(size(t));
end

end