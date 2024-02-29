function  [UserVar,C,m]=DefineSlipperyDistribution(UserVar,CtrlVar,MUA,time,s,b,h,S,B,rho,rhow,GF)

m=3; 

%  u=C*tau^m
%  C in kPa m^(-1/3) a^(1/3)

Cprime=7.624e6*1e-3*(365.25*24*60*60)^(-1/3) + MUA.coordinates(:,1)*0; % as defined in Pattyn et al 2012
C = Cprime.^(-m); % convert to Ua definitions

end