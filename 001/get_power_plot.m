prompt = 'ファイル名を入力してください : ';
prompt2 = '指定したい点を入力してください : ';
file = input(prompt);
[y,fs] = audioread(file); % ファイルの読み込み
N=512; %512点のFFTをする
T = input(prompt2);
x=y(T:T+N-1).*hann(N); %『い』の部分の点(5650の点から512点の幅をハニング窓をかける)
plot(x); % 窓かけした時間波形をプロット
X=fft(x); % FFT(高速フーリエ変換)する
f=(0:N-1)/N*fs; % 周波数の公式(0から点数-1/点数*サンプリング周波数)
psp=abs(X).^2/N; % パワースペクトル
plot(f,10*log10(psp)); % プロットする
xlim([0 fs/2]); % x軸の最大幅を半分にする(これは16kHzだから8kHzまで)