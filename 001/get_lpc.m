prompt = 'ファイル名を入力してください : ';
prompt2 = '指定したい秒数を入力してください : ';
prompt3 = 'FFTのサンプリング点数を入力してください : ';
file = input(prompt);
[y,fs]=audioread(file');
T = input(prompt2);
N = input(prompt3);
xi=y(T:T+N-1).*hann(N);
Xi=fft(xi);
spc=10*log10(abs(Xi).^2/N);

f=(0:N-1)/N*fs;
plot(f,10*log10(abs(Xi).^2/N));

[a,g]=lpc(xi,34);
[h,ff]=freqz(sqrt(g),a,N,fs);
hold on; 
plot(ff,10*log10(abs(h).^2));

xlim([0 fs/2]); % x軸の最大幅を半分にする(これは16kHzだから8kHzまで)

rts=roots(a);
rts=rts(imag(rts)>0);
rts=rts(abs(rts)>0.9);
sort(round(angle(rts)/pi*fs/2))'
