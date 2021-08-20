function  [sol,WO,NOCC,M,WUAV,nZ,b,Qtot,Qint,NTANK,NENG,SFUS,lHT,lFS,dFS,q,VP,DP,SHT,TtC,HS,AR,TR,WENG,nl,Wl,Lm,Ln,FT,VS,SVT,SW,WFW,WS] = UserIps(key)

switch key
    case 1
        [sol,SW,WFW,AR,WS,q,TR,TtC,nZ,WO] =  WWIps;
    case 2
        [sol,nZ,WO,q,SHT,TtC,HS,AR,TR] = WHTIps;
    case 3
        [sol,SFUS,nZ,WO,lHT,lFS,dFS,q,VP,DP] = WFUSIps;
    case 4
        [sol,FT,nZ,WO,q,TtC,SVT,VS,AR,TR] = WVTIps;
    case 5
        [sol,nl,Wl,Lm] = WMLGIps;
    case 6
        [sol,nl,Wl,Ln] = WNLGIps;
    case 7 
        [sol,WENG,NENG] = WIEIps;
    case 8
        [sol,WUAV] = WASIps;
    case 9
        [sol,Qtot,Qint,NTANK,NENG] = WFSIps;
    case 10 
        [sol,WUAV,WO] = WESIps;
    case 11
        [WO,NOCC,M,WUAV] = WACIps;
    case 12
        [sol,lFS,nZ,WO,b] = WFCSIps;
    case 13 
        [sol,WO] = WFIps;
    case 14
        [sol,WO] = WHSIps;
    case 15
        [sol,WO,NOCC,M,WUAV,nZ,b,Qtot,Qint,NTANK,NENG,SFUS,lHT,lFS,dFS,q,VP,DP,SHT,TtC,HS,AR,TR,WENG,nl,Wl,Lm,Ln,FT,VS,SVT,SW,WFW,WS] = WtotIps;
    otherwise
        fprintf('Invalid Choice')       
end
