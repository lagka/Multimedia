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
N=size(x);
w=zeros(segment_duration,1);
row=1;
s=zeros(segment_duration,1);

for n=1:segment_duration
   w(n)=0.5-0.5*cos((2*pi*n)/segment_duration); 
end    
for k=1 : segment_duration-segment_overlap : N-segment_duration
     
    s=x(k:k+segment_duration-1);
   
    t=s.*w;
    sf=fft(t);
    S(:,row)=sf;
    T(:,row)=(k+k+segment_duration-1)/2/samplerate;
    row=row+1;
end    
F=(0:row-1)*samplerate/segment_duration;

