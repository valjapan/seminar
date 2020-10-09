prompt = 'ファイル名を入力してください : ';
prompt2 = '指定したい点を入力してください : ';
file = input(prompt);
[y,fs]=audioread(file');
N=512;
T = input(prompt2);
xi=y(T:T+N-1).*hann(N);
Xi=fft(xi);
spc=10*log10(abs(Xi).^2/N);
f=(0:N-1)/N*fs;
cps=ifft(spc); %ケプストラム
lifter=ones(N,1);
lifter(21:N-21+2)=0; % 21は適当(なんでや)
cps2=cps.*lifter;
spc2=real(fft(cps2));
plot(f,spc,f,spc2,'-r');
xlim([0 fs/2]); % x軸の最大幅を半分にする(これは16kHzだから8kHzまで)