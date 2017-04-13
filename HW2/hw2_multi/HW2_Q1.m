%%% HW2_Q1.m - Complete the procedure of separating HW2_mix.wav into 3 songs

%% Clean variables and screen
close all;
clear;
clc;

%% Visualization parameters (Change it if you want)
% Some Tips:
% (Tip 1) You can change the axis range to make the plotted result more clearly 
% (Tip 2) You can use subplot function to show multiple spectrums / shapes in one figure
titlefont = 15;
fontsize = 13;
LineWidth = 1.5;

%% 1. Read in input audio file ( audioread )
% y_input: input signal, fs: sampling rate
[y_input, fs] = audioread('audio/HW2_Mix.wav');

%%% Plot example : plot the input audio
% The provided function "make_spectrum" generates frequency
% and magnitude. Use the following example to plot the spectrum.
figure
[frequency, magnitude] = make_spectrum(y_input, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])
title('Input', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

%% 2. Filtering 
% (Hint) Implement my_filter here
 [outputSignal1,outputFilter1] = my_filter(y_input, fs, 601, 'Blackmann', 'Low-pass', 250);
 [outputSignal2,outputFilter2] = my_filter(y_input, fs, 551, 'Blackmann', 'High-pass', 850);
 [outputSignal3,outputFilter3] = my_filter(y_input, fs, 701, 'Blackmann', 'Band-pass', [500 520]);
%%% Plot the shape of filters in Time domain
figure
w1=(1:601);
plot(w1,outputFilter1);
figure
w2=(1:551);
plot(w2,outputFilter2);
figure
w3=(1:701);
plot(w3,outputFilter3);
%%% Plot the spectrum of filters (Frequency Analysis)
figure
[frequency, magnitude] = make_spectrum(outputFilter1, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])
figure
[frequency, magnitude] = make_spectrum(outputFilter2, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])
figure
[frequency, magnitude] = make_spectrum(outputFilter3, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])


%% 3. Save the filtered audio (audiowrite)
% Name the file 'FilterName_para1_para2.wav'
% para means the cutoff frequency that you set for the filter
player=audioplayer(outputSignal2,fs);
play(player);
audiowrite('LowPass_601.wav', outputSignal1, fs);
audiowrite('HighPass_551.wav', outputSignal2, fs);
audiowrite('BandPass_500_520.wav', outputSignal3, fs);

%%% Plot the spectrum of filtered signals
figure
[frequency, magnitude] = make_spectrum(outputSignal1, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])
figure
[frequency, magnitude] = make_spectrum(outputSignal2, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])
figure
[frequency, magnitude] = make_spectrum(outputSignal3, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000])


