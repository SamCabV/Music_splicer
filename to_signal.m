function [x, t] = to_signal(s,fs)
win_size = 0.01;

wlen = 1000;
hop = fs*win_size;
nfft = 4*wlen;

% generate analysis and synthesis windows
anal_win = blackmanharris(wlen, 'periodic');
synth_win = hamming(wlen, 'periodic');

[x, t] = istft(s, anal_win, synth_win, hop, nfft, fs);

end