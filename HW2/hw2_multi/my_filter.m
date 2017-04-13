function [outputSignal, outputFilter] = my_filter(inputSignal, fsample, N, windowName, filterName, fcutoff)
%%% Input 
% inputSignal: input signal
% fsample: sampling frequency
% N : size of FIR filter(odd)
% windowName: 'Blackmann'
% filterName: 'low-pass', 'high-pass', 'bandpass', 'bandstop' 
% fcutoff: cut-off frequency or band frequencies
%       if type is 'low-pass' or 'high-pass', para has only one element         
%       if type is 'bandpass' or 'bandstop', para is a vector of 2 elements

%%% Ouput
% outputSignal: output (filtered) signal
% outputFilter: output filter 

%% 1. Normalization
    fcutoff=fcutoff/fsample;
    wc=2*pi*fcutoff;
    middle=round(N/2);


%% 2. Create the filter according the ideal equations (slide #76)
% (Hint) Do the initialization for the outputFilter here
 if strcmp(filterName,'Low-pass') == 1
     for n=ceil(-N/2):floor(N/2)
        if(n==0)outputFilter(middle)=1;
        else    outputFilter(n+middle)=sin((wc*n))/(pi*n);
        end    
        outputFilter(middle)=2*fcutoff;
     end    
 elseif strcmp(filterName,'High-pass') == 1
     for n=ceil(-N/2):floor(N/2)
        if(n==0)outputFilter(middle)=1;
        else    outputFilter(n+middle)=-sin((wc*n))/(pi*n);
        end    
        outputFilter(middle)=1-2*fcutoff;
     end    
 elseif strcmp(filterName,'Band-pass') == 1    
     for n=ceil(-N/2):floor(N/2)
        if(n==0)
            outputFilter(middle)=1;
        else    outputFilter(n+middle)=sin(2*pi*fcutoff(2)*n)-sin(2*pi*fcutoff(1)*n)/(pi*n);
        end    
        outputFilter(middle)=2*(fcutoff(2)-fcutoff(1));
     end    
 end

%% 3. Create the windowing function (slide #80) and Get the realistic filter
 if strcmp(windowName,'Hanning') == 1 
     for n=1:N
        outputFilter(n)=outputFilter(n)*(0.5-0.5*cos((2*pi*n)/N)); 
     end    
 elseif strcmp(windowName,'Hamming') == 1 
     for n=1:N
        outputFilter(n)=outputFilter(n)*(0.54-0.46*cos((2*pi*n)/N)); 
     end     
 elseif strcmp(windowName,'Blackmann') == 1 
     for n=1:N
        outputFilter(n)=outputFilter(n)*(0.42-0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1))); 
     end        
 end


%% 4. Filter the input signal in time domain. Do not use matlab function 'conv'
outputSignal = zeros( length(inputSignal) , 1);

for n=1:length(inputSignal)
    for k=1:N
        a=n-k;     
        if(a<1)
            h=0;
        else h=inputSignal(a);
        end
        outputSignal(n)=outputSignal(n)+outputFilter(k)*h;
   end    
end




