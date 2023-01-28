close all;
clear;
clc;

pkg load signal;

fs=44100;

[filename,pathname]=uigetfile('*.*','Select the input audio');
[y,fs] = audioread('noiseviolin.wav'); %loading the audio file

sound(y,fs); %playing the audio file including the noise


%---------------ploting the audio file in the time spectrum----------------%
y = y(:,1);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
figure;
plot(t,y);
xlabel('Seconds');
ylabel('Amplitude');

%-------------ploting the audio file in the frequency spectrum (FFT)---------%


%----FFT function ----%
x=fft(y);

  m=length(x);

  frequencyAxis=(0:m)*fs/m;
  fftMagnitude=abs(x);

  %construct freq axis
  frequency=[-(frequencyAxis(m) - frequencyAxis(m/2:1)) frequencyAxis(1:m/2)];
  magnitude=[-fftMagnitude(m/2:1) fftMagnitude(1:m/2)];

%------------------------------------------------------------------%

figure;
plot(frequency,magnitude);
xlabel('Frequency');
ylabel('Magnitude');

%after the first plot of the signal we can see that there's noise ontop of the sample sound of the violin
%the noise is of lower frequency than that of the violin
%for this reason we are going to apply a high-pass filter in order to cut out the noise
%thus we will end up with an audio with just the violin playing

%creating a High pass filter

Fp=500; %Passband Frequency in Hz
Fst=450; %Stopband Frequency in Hz
Ap=1; %Passband ripple in dB
Ast=95; %Stopband attenuation in dB

df=designfilt('highpassfir','PassbandFrequency',Fp,'StopbandFrequency',Fst,'PassbandRipple',Ap,'StopbandAttenuation',Ast,'SampleRate',fs);

fy=filter(df,y); %fy stands for filtered y in which case is our audio file


%ploting the filtered signal
figure;
plot(t,fy);
title('Filtered signal');

%writing the new filtered audio
filename='filteredviolin.wav';
audiowrite('filteredviolin.wav',fy,fs);

[fy,fs]=audioread('filteredviolin.wav');

%run the following script seperetaly selectin the new audiowrite file named filteredviolin.wav from your directory
%
%fs=44100;
%
%[filename,pathname]=uigetfile('*.*','Select the input audio');
%[y,fs] = audioread('filteredviolin.wav'); %loading the audio file
%
%sound(y,fs);
%
