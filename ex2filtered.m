fs=44100;

[filename,pathname]=uigetfile('*.*','Select the input audio');
[y,fs] = audioread('filteredviolin.wav'); %loading the audio file

sound(y,fs);

