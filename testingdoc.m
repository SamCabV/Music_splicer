fs = 1000;
t = 0:1/fs:2;
x = chirp(t,100,1,200,'quadratic');

spectrogram(x,128,120,128,fs,'yaxis')
title('Quadratic Chirp')