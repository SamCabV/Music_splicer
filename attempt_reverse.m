clear, clc, close all

% load an audio signal
[y, fs] = audioread('000/000005.mp3'); 

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
% generate analysis and synthesis windows
anal_win = blackmanharris(wlen, 'periodic');
synth_win = hamming(wlen, 'periodic');

[s,f,~] = spectrogram(signal,w ,hop, nfft, fs);

[x_istft, t_istft] = istft(s, anal_win, synth_win, hop, nfft, fs);


figure(1)
plot(t, signal, 'b')
grid on
xlim([0 max(t)])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Signal amplitude')
title('Original and reconstructed signal')

% plot the resynthesized signal 
hold on
plot(t_istft, x_istft, '-.r')
legend('Original signal', 'Reconstructed signal')
sound(x_istft, fs)