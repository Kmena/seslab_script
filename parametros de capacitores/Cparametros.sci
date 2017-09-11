function [B,C,D,E,F,G] = Cparacmetros(VC,V,RL,RD,RP,C)
    R1=RL*RD;
    R2=R1*C;
    R3=RD+RL
    R4=RD*C;
    R5=RP*RL;
    R6=R2*RP;
    R7=R4*RP;
    R8=R7+R2;
    R9=RP+R3;
    A=R5+R1;
    B=VC*R6;
    C=VC*A;
    D=V*R1;
    E=VC*R9
    F=VC*R8+V*R2;
    G=V*R3;
endfunction
