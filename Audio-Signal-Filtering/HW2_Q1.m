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
[frequency, magnitude] = make_spectrum(y_input, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
xlim([0 1000]);
title('Input', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

%% 2. Filtering 
% (Hint) Implement my_filter here
% [...] = my_filter(...);

[outputSignal1, outputFilter1] = my_filter(y_input, fs, 601, 'Blackmann', 'low-pass', 250);

[outputSignal2, outputFilter2] = my_filter(y_input, fs, 551, 'Blackmann', 'high-pass', 908);

[outputSignal3, outputFilter3] = my_filter(y_input, fs, 701, 'Blackmann', 'bandpass', [500 530]);

%%% Plot the shape of filters in Time domain

% w for winsow size
w1 = (1:601);
w2 = (1:551);
w3 = (1:701);
figure
plot(w1,outputFilter1);
title('Low-Pass-Time-domain', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

figure
plot(w2,outputFilter2);
title('Band-Pass-Time-domain', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

figure
plot(w3,outputFilter3);
title('High-Pass-Time-domain', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

%%% Plot the spectrum of filters (Frequency Analysis)
[frequency1, magnitude1] = make_spectrum(outputFilter1, fs);
[frequency2, magnitude2] = make_spectrum(outputFilter2, fs);
[frequency3, magnitude3] = make_spectrum(outputFilter3, fs);

figure
plot(frequency1, magnitude1, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
xlim([0 1000]);
title('Low-Pass', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

figure
plot(frequency2, magnitude2, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
xlim([0 1000]);
title('High-Pass', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

figure
plot(frequency3, magnitude3, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
xlim([0 1000]);
title('Band-Pass', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)



%% 3. Save the filtered audio (audiowrite)
% Name the file 'FilterName_para1_para2.wav'
% para means the cutoff frequency that you set for the filter

player = audioplayer(outputSignal2, fs);
play(player);

audiowrite('LowPass_250.wav', outputSignal1, fs);
audiowrite('HighPass_908.wav', outputSignal2, fs);
audiowrite('BandPass_500_530.wav', outputSignal3, fs);

%%% Plot the spectrum of filtered signals

[frequency11, magnitude11] = make_spectrum(outputSignal1, fs);
[frequency22, magnitude22] = make_spectrum(outputSignal2, fs);
[frequency33, magnitude33] = make_spectrum(outputSignal3, fs);

figure
plot(frequency11, magnitude11, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
xlim([0 1000]);
title('Low-Pass-Result', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

figure
plot(frequency22, magnitude22, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
xlim([0 1000]);
title('High-Pass-Result', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

figure
plot(frequency33, magnitude33, 'LineSmoothing', 'on', 'LineWidth', LineWidth);
xlim([0 1000]);
title('Band-Pass-Result', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize)

