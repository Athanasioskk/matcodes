close all;
clear;
clc;

pkg load signal;

%EEG signal processing and analysis
%Using Butterworth IIR Filters

load EEG.mat;

N=4;
fs=200;
time=0:1/fs:(length(eeg)-1)*1/fs;

%Delta
Wn_d=2*4/fs;
[b,a]=butter(N,Wn_d);
delta=filter(b,a,eeg);

      %Verify in frequency domain
      in_vect=delta;
      [fre,amp,phaz]=fftFun(in_vect, fs);
      figure(1);
      title('Frequency Content');
      hold on;
      subplot(221); 
      plot(freq, amp);
      xlabel('Frequnecy (Hz)');
      ylabel('Amplitude');
      title('Delta Waves');
      
%Theta
W1=2*4/fs;
W2=2*8/fs;
Wn_t=[W1 W2];
[c,d]=butter(N,Wn_t);
theta=filter(c,d,eeg);

      %Verify in frequency domain
      in_vect=theta;
      [freq,amp,phaz]=fftFun(in_vect, fs);
      figure(1);
      title('Frequency Content');
      hold on;
      subplot(222); 
      plot(freq, amp);
      xlabel('Frequnecy (Hz)');
      ylabel('Amplitude');
      title('Theta Waves');
      
%Alpha
W3=2*8/fs;
W4=2*13/fs;
Wn_a=[W3 W4];
[e,f]=butter(N,Wn_a);
alpha=filter(e,f,eeg);

      %Verify in frequency domain
      in_vect=alpha;
      [freq,amp,phaz]=fftFun(in_vect, fs);
      figure(1);
      title('Frequency Content');
      hold on;
      subplot(223); 
      plot(freq, amp);
      xlabel('Frequnecy (Hz)');
      ylabel('Amplitude');
      title('Alpha Waves');
      
%Beta
W5=2*13/fs;
W6=2*40/fs;
Wn_b=[W5 W6];
[g,h]=butter(N,Wn_b);
beta=filter(g,h,eeg);

      %Verify in frequency domain
      in_vect=beta;
      [freq,amp,phaz]=fftFun(in_vect, fs);
      figure(1);
      title('Frequency Content');
      hold on;
      subplot(223); 
      plot(freq, amp);
      xlabel('Frequnecy (Hz)');
      ylabel('Amplitude');
      title('Beta Waves');
      
%Show figure of raw signal
in_vect=eeg;
[freq,amp,phaz]=fftFun(in_vect,fs);
figure;
plot(freq,amp);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Raw EEG signal');

              %----- Figures -----%
              figure;
              hold on;
              title('EEG wave patterns');
              subplot(511); plot(time,eeg);
                xlabel('Time(s)');
                ylabel('Amplitude');
                title('Raw EEG Signal');
              subplot(512); plot(time,delta);
                xlabel('Time(s)');
                ylabel('Amplitude');
                title('Delta Waves');
              subplot(513); plot(time,theta);
                xlabel('Time(s)');
                ylabel('Amplitude');
                title('Theta Waves');
              subplot(514); plot(time,alpha);
                xlabel('Time(s)');
                ylabel('Amplitude');
                title('Alpha Waves');
              subplot(515); plot(time,beta);
                xlabel('Time(s)');
                ylabel('Amplitude');
                title('Beta Waves');
              hold off;
              