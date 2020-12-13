myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.mp3'));
[user_song, f_user] = audioread(myFiles(1).name);
user_spect = to_spectrogram(user_song, f_user);

spect_library = cell(1,length(myFiles));
for k = 1:length(myFiles)
    [song, fs] = audioread(myFiles(k).name);
    song_spect = to_spectrogram(song, fs);
    spect_library{1,k} = song_spect;
end