% rtrend.m
% function to remove a linear trend like in sac
% simply a wrapper for the matlab function 'detrend'
% usage:
% detrended = rtrend(data);

function a=rtrend(b)
    a=detrend(b);
    
    