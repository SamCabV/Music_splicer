myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.mp3'));
fs = 44100;
samples=[1,(40*fs)];
[user_song, f_user] = audioread(myFiles(1).name,samples);
s1 = to_spectrogram(user_song, f_user);
spec_list = cell(1,length(myFiles));
cut_list = cell(1,length(myFiles)-1);

for k = 1:length(myFiles)
    [song, fs] = audioread(myFiles(k).name,samples);
    song_spect = to_spectrogram(song, fs);
    spec_list{1,k} = song_spect;
end
spec_list(1) = [];
[global_min, I_global] = findGlobalDifference(s1, spec_list(1:end),15);
[~,~,start_s2,stop_s1] = findMinDifference(s1, spec_list{I_global},15);
cut_list{1,1} = s1(:,(1:stop_s1));

for i = 2:(length(spec_list))
   s1 = spec_list{I_global}(:,(start_s2:end));
   time_left = map(length(s1), 1, length(spec_list{I_global}), 0, 39);
   spec_list(I_global) = [];
   [global_min, I_global] = findGlobalDifference(s1, spec_list(1:end),time_left);
   [~,~,start_s2,stop_s1] = findMinDifference(s1, spec_list{I_global},time_left);
   if size(s1,2) > stop_s1 
        cut_list{1,i} = s1(:,(1:stop_s1));
   else
        cut_list{1,i} = s1(:,(1:end));
   end
end

split = splice_vect(cut_list{1},cut_list{2}, 1, size(cut_list{1},2), 1, size(cut_list{2},2));
for i = 3:length(cut_list)
    split = splice_vect(split,cut_list{i}, 1, size(split,2), 1, size(cut_list{i},2));
end

[x,t_exp] = to_signal(split,fs);
sound(x,fs)
