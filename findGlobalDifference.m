function [global_min, I_global] = findGlobalDifference(user_song_spect, spect_lib, t_song_init)
global_min_list = zeros(2,length(spect_lib));
for i = 1:length(spect_lib)
    [global_min_list(1,i),global_min_list(2,i),~,~] = findMinDifference(user_song_spect, spect_lib{i},t_song_init);
end
[global_min,I_global] = min(global_min_list(1,:));
end