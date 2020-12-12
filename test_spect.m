clear all
[y,fs] = audioread("000/000002.mp3");
win_size = 0.01;
fft_overlap = 0.5;
signal = sum(y, 2) / size(y, 2); %use only the left channel 
hop_size = fs*win_size;
nfft = hop_size/fft_overlap;
noverlap = nfft-hop_size;
w = sqrt(hann(nfft));
[s,f,t] = spectrogram(signal,w ,noverlap, nfft, fs,'power');


% %window=hamming(100,'periodic');
% figure(1)
% [s,f,t,psd] = spectrogram(signal,w ,noverlap, nfft, fs,'power');
% surf(t,f,10*log10(psd),'EdgeColor','none');
% colormap gray
% ax=gca;
% colorlim = get(ax,'clim');
% newlim = [(colorlim(1)*0.8),colorlim(2)];
% set(ax,'clim',(newlim));%spectrogram(x,128,120,128,1e3)
% figure(2)
% spectrogram(signal,w ,noverlap, nfft, fs,'yaxis')
% %sound(signal, fs);
