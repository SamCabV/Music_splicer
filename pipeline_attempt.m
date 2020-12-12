[y, fs1] = audioread('000/000002.mp3'); 
[z, fs2] = audioread('000/000005.mp3');
[s1,f1] = to_spectrogram(y,fs1);
[s2,f2] = to_spectrogram(z,fs2);
stop_s1 = round(map(15, 0, 30, 1, length(s1)));

min_list = zeros((length(s1)-stop_s1),3);
min_list = transpose(min_list);
for i = 1:length(min_list)
    new_stop = stop_s1 + i;
    [min_cut, I] = end_weight(s1,s2,new_stop);
    min_list(1,i) = min_cut;
    min_list(2,i) = I;
    min_list(3,i) = new_stop;
end

[total_min,I_total_min] = min(min_list(1,:));
start_s2 = min_list(2,I_total_min);
stop_s1 = min_list(3, I_total_min);

[~,best] = min(min_list(2,:));

split = splice_vect(s1,s2, 1, stop_s1, start_s2, length(s2));
split_perf = [s1 s2];

[x,t_exp] = to_signal(split,fs1);
[x_perf,t_exp] = to_signal(split_perf,fs1);

sound(x,fs1)