prompt = '�t�@�C��������͂��Ă������� : ';
prompt2 = '�w�肵�����_����͂��Ă������� : ';
prompt3 = 'FFT�̃T���v�����O�_������͂��Ă������� : ';
file = input(prompt);
[y,fs]=audioread(file');
N = input(prompt3);
T = input(prompt2);
xi=y(T:T+N-1).*hann(N);
Xi=fft(xi);
spc=10*log10(abs(Xi).^2/N);
f=(0:N-1)/N*fs;
cps=ifft(spc); %�P�v�X�g����
lifter=ones(N,1);
lifter(21:N-21+2)=0; % 21�͊��炵�(�Ȃ�ł�)
cps2=cps.*lifter;
spc2=real(fft(cps2));
plot(f,spc,f,spc2,'-r');
xlim([0 fs/2]); % x���̍ő啝�𔼕��ɂ���(�����16kHz������8kHz�܂�)