% bp_bu_co.m
% band pass butterworth filter implementation
% usage:
% filtered_data = bp_bu_co(data,corner_low (Hz), corner_high (Hz), samples_per_second, order, passes)
% designed to mimic sac
% for example, to band pass filter data at 10 seconds to 1 second in sac you would type:
% bp bu co 0.1 1
% with the default order (number of poles) at 2
% this function would have the syntax if the data was at 40 samples per second:
% filtered = bp_bu_co(data,0.1,1,40,2);
% matlab uses the command butter as:
% [a,b] = butter(order,w,'type') where the frequency is defined as nyquist * w (w is
% from 0 to 1). 
%
% passes should be 1 for causal or 2 for acausal


function y = bp_bu_co(x,corner_low, corner_high,sps,n,t)
    nyquist = sps / 2;
    w1 = corner_low / nyquist;
    w2 = corner_high / nyquist;
    [b,a] = butter(n,[w1 w2]);
    if t == 1
        y = filter(b,a,x);
    else
        y = filtfilt(b,a,x);
    end
    
    return
    