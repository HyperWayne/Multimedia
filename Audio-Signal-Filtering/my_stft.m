function [S, F, T] = my_stft(x, segment_duration, segment_overlap, samplerate)
% my_stft:
% input
% x: The target signal.
% segment_duration: The number of samples of each segment.
% segment_overlap: The number of samples overlapping on two adjacent segments.
%
% output
% S: Short-time Fourier transform, returned as a matrix. Time increases across the columns of S and frequency increases down the rows, starting from zero.
% F: Cyclical frequencies, returned as a vector. F has a length equal to the number of rows of S.
% T: Time instants, returned as a vector. The time values in T correspond to the midpoint of each segment.

%% Your implementation

N = length(x);
w = hann(segment_duration);
Chunk = zeros(segment_duration,1);
Starting_Sample = zeros(120);

k = 1;
Starting_Sample(1) = 1;

for i = (1+segment_duration) : (segment_duration-segment_overlap-1) : (N-segment_duration)

    for s = 1:segment_duration
        Chunk(s) = x(Starting_Sample(k)+s);
    end
    Chunk = Chunk.*w ;
    FFT = fft(Chunk);
    T(k) = Starting_Sample(k) + (segment_duration/2);
    S(:,k) = FFT(:);
    k = k + 1;
    Starting_Sample(k) = i - segment_overlap;
end

    F = 0:20:(119*20);
    T = T / samplerate;

end
