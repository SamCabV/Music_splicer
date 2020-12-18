% Just run the function, click on a folder full of WAV files, and you're
% good to go. use Sound to listen to the mix, or audiowite to save it as a
% wav file
[x,t_exp] = function_pipeline();


sound(x,fs)
audiowrite("splice_mix.wav", x, fs)