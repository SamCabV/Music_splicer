clear all 
     
[y, fs1] = audioread('000/000005.mp3'); 
[z, fs2] = audioread('000/000002.mp3');
[s1,f1] = to_spectrogram(y,fs1);
[s2,f2] = to_spectrogram(z,fs2);
double_spect = [s1 s2];


split = splice(s1, s2, 0, 13, 3, 16);

[x,t_exp] = to_signal(split,fs1);

sound(x,fs1)