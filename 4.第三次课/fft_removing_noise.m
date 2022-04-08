%% clear 
clc, clear all, close all;

%% remove sound
[y, Fs] = audioread('dylanf_noise.m4a');
y_renoise = wdenoise(y);
% sound(y_renoise, Fs)

%% analysis fft
T = 1/Fs;
L = 44100;
Y = fft(y_renoise);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1);
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');ylabel('|P1(f)|');