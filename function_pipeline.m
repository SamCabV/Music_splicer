myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.mp3'));
[user_song, f_user] = audioread(myFiles(1).name);
s1 = to_spectrogram(user_song, f_user);
spec_list = cell(1,length(myFiles));
cut_list = cell(1,length(myFiles)-1);
for k = 1:length(myFiles)
    [song, fs] = audioread(myFiles(k).name);
    song_spect = to_spectrogram(song, fs);
    spec_list{1,k} = song_spect;
end
spec_list(1) = [];
[global_min, I_global] = findGlobalDifference(s1, spec_list(1:end),15);
[~,~,start_s2,stop_s1] = findMinDifference(s1, spec_list{I_global},15);
cut_list{1,1} = s1(:,(1:s1_stop));

for i = 2:(length(spec_list)-1)
   s1 = spec_list{I_global}(:,(start_s2:end));
   time_left = map(length(s1), 1, length(spec_list{I_global}), 0, 30);
   spec_list(I_global) = [];
   [global_min, I_global] = findGlobalDifference(s1, spec_list(1:end),time_left);
   [~,~,start_s2,stop_s1] = findMinDifference(s1, spec_list{I_global},time_left);
   cut_list{1,i} = s1(:,(1:stop_s1));
end

%split = splice_vect(s1,spec_list{I_global}, 1, stop_s1, start_s2, length(spec_list{I_global}));


[x,t_exp] = to_signal(split,fs);
sound(x,fs1)