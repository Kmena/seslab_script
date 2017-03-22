function [Mc] = guardar(Mc,c,rf,rfs,rp,ro,rd,rl,ld,n)
    Mc(n,1)=c;
    Mc(n,2)=rp;
    Mc(n,3)=rf;
    Mc(n,4)=rfs;
    Mc(n,5)=ld;
    Mc(n,6)=rl;
    Mc(n,7)=rd;
    Mc(n,8)=ro;
endfunction
