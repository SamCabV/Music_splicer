[y, fs1] = audioread('000/000005.mp3'); 
[z, fs2] = audioread('000/000002.mp3');
[s1,f1] = to_spectrogram(y,fs1);
[s2,f2] = to_spectrogram(z,fs2);
double_spect = [s1 s2];

stop_s1 = map(15, 0, 30, 1, length(s1));
cut_s1 = s1(1,(1:stop_s1));
[I] = end_weight(s1, s2, stop_s1);

split = splice_vect(s1,s2, 1, stop_s1, I, length(s2));
split_perf = [s1 s2];

[x,t_exp] = to_signal(split,fs1);
[x_perf,t_exp] = to_signal(split_perf,fs1);

sound(x_perf,fs1)