[user_song, f_user] = audioread(myFiles(6).name,samples);
%to_spectrogram_img(user_song,f_user)
plot(user_song(:,1))