function [s,f] = to_spectrogram(y,fs)
win_size = 0.01;
signal = sum(y, 2) / size(y, 2); %use only the left channel 

% signal parameters
xlen = length(signal);                   
t = (0:xlen-1)/fs;                  

% define the analysis and synthesis parameters
wlen = 1000;
hop = fs*win_size;
nfft = 4*wlen;
w = sqrt(hann(nfft/4.53));
% generate analysis and synthesis window

[s,f,~] = spectrogram(signal,w ,hop, nfft, fs,'power');
end