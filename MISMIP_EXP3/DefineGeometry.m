function [UserVar,s,b,S,B,alpha]=DefineGeometry(UserVar,CtrlVar,MUA,time,FTBD)

% Defines model geometry

x=MUA.coordinates(:,1); y=MUA.coordinates(:,2);
alpha=0.;

% sea surface height
if contains(FTBD,'S')
    S = x*0 ;
else
    S=NaN;
end

% bed height
if contains(FTBD,'B')
    B = (729-2184.8*(x/750e3).^2+1031.72*(x/750e3).^4-151.72*(x/750e3).^6);
else
    B = NaN;
end

% draft and surface
if contains(FTBD,'b') || contains(FTBD,'s')
    % initial ice tickness
    h = 0*x+10; h(x>479.1)=CtrlVar.ThickMin;
    % obtain b and s
    [UserVar,rho,rhow,g]=DefineDensities(UserVar,CtrlVar,MUA,time,0*x,0*x,0*x,0*x,0*x); %it's ok to provide zeros for the geometry field, because the densities do not depend on them in this case.
    B = (729-2184.8*(x/750e3).^2+1031.72*(x/750e3).^4-151.72*(x/750e3).^6);
    S = x*0 ;
    [b,s,~,~]=Calc_bs_From_hBS(CtrlVar,MUA,h,S,B,rho,rhow);
else
    b = NaN;
    s = NaN;
end

end