function [UserVar,AGlen,n]=DefineAGlenDistribution(UserVar,CtrlVar,MUA,time,s,b,h,S,B,rho,rhow,GF)

time_intervals = [0 3e4 1.5e4 1.5e4 1.5e4 1.5e4 3e4 3e4 1.5e4 1.5e4 3e4 3e4 3e4 1.5e4];
time_cumsum = cumsum(time_intervals);

AGlen_intervals = [3 2.5 2 1.5 1 0.5 0.25 0.5 1 1.5 2 2.5 3]*1e-25;

AGlen = F(xxxxxx,time)

I = find(time_cumsum-time<=0);

AGlen = AGlen_intervals(I(end))*1e9*365.25*24*60*60;
n=3;

end