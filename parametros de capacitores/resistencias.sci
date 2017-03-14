    function [rf,rfs,rp,ro] = resistencias(iter,err)
    //resistencia rp
    n=1;
    Perr=1;
    Mrp=zeros(iter,3)
    Vf=input('voltaje de fuente')
    If=input('corriente de fuente')
    Mrp(n,1)=Vf/If;
    Mrp(n,2)=Vf/If;
    Mrp(n,3)=1;
    while((iter>n & Mrp(n,2)*(err/100)<Perr)| n==1)
        n=n+1;
        Vf=input('voltaje de fuente')
        If=input('corriente de fuente')
        Mrp(n,1)=Vf/If;
        for j= 1:n
            Mrp(n,2)=Mrp(n,2)+Mrp(j,1)
        end
        Mrp(n,2)=Mrp(n,2)/n
        Perr=sqrt((Mrp(n,2)-Mrp(n-1,2))^2)
        Mrp(n,3)=Perr
        disp(Mrp(n,2),Mrp(n,3),n) 
    end
    rp=Mrp(2,2)
    Perr=Mrp(2,3)
    for j=2:n
        if(Mrp(n,3)<Perr)
            rp=Mrp(n,2)
            Perr=Mrp(n,3)
        end
    end
    disp('rp lista')
    disp(Mrp(n,2),Mrp(n,3),n)
    //resitencia Ro
    n=1;
    Perr=1;
    Mro=zeros(iter,3)
    Vf=input('voltaje de fuente')
    If=input('corriente de fuente')
    Mro(n,1)=Vf/If;
    Mro(n,2)=Vf/If;
    Mro(n,3)=1;
    while((iter>n & Mro(n,2)*(err/100)<Perr)| n==1)
        n=n+1;
        Vf=input('voltaje medido')
        If=input('corriente de fuente')
        Mro(n,1)=Vf/If;
        for j= 1:n
            Mro(n,2)=Mro(n,2)+Mro(j,1)
        end
        Mro(n,2)=Mro(n,2)/n
        Perr=sqrt((Mro(n,2)-Mro(n-1,2))^2)
        Mro(n,3)=Perr 
        disp(Mro(n,2),Mro(n,3),n)
    end
    ro=Mro(2,2)
    err=Mro(2,3)
    for j=2:n
        if(Mro(n,3)<Perr)
            ro=Mro(n,2)
            err=Mro(n,3)
        end
    end
    disp('ro lista')
    disp(Mro(n,2),Mro(n,3),n)
    //resitencia Rf
    n=1;
    Perr=1;
    Mrf=zeros(iter,3)
    Vf=input('voltaje fuente')
    Vm=input('voltaje medido')
    If=input('corriente de fuente')
    Mrf(n,1)=(Vf-Vm)/If;
    Mrf(n,2)=Mrf(n,1);
    Mrf(n,3)=1;
    while((iter>n & Mrf(n,2)*(err/100)<Perr)| n==1)
        n=n+1;
        Vf=input('voltaje fuente')
        Vm=input('voltaje medido')
        If=input('corriente de fuente')
        Mrf(n,1)=(Vf-Vm)/If;
        for j= 1:n
            Mrf(n,2)=Mrf(n,2)+Mrf(j,1)
        end
        Mrf(n,2)=Mrf(n,2)/n
        Perr=sqrt((Mrf(n,2)-Mrf(n-1,2))^2)
        Mrf(n,3)=Perr 
        disp(Mrf(n,2),Mrf(n,3),n)
    end
    rf=Mrf(2,2)
    Perr=Mrf(2,3)
    for j=2:n
        if(Mrf(n,3)<Perr)
            rf=Mrf(n,2)
            Perr=Mrf(n,3)
        end
    end
    disp('lista rf')
    disp(Mrf(n,2),Mrf(n,3),n)
    
    n=1;
    Perr=1;
    Mrfs=zeros(iter,3)
    Vf=input('voltaje fuente')
    Vm=input('voltaje medido')
    If=input('corriente de fuente')
    Mrfs(n,1)=(Vf-Vm)/If;
    Mrfs(n,2)=Mrfs(n,1);
    Mrfs(n,3)=1;
    while((iter>n & Mrfs(n,2)*(err/100)<Perr)| n==1)
        n=n+1;
        Vf=input('voltaje fuente')
        Vm=input('voltaje medido')
        If=input('corriente de fuente')
        Mrfs(n,1)=(Vf-Vm)/If;
        for j= 1:n
            Mrfs(n,2)=Mrfs(n,2)+Mrfs(j,1)
        end
        Mrfs(n,2)=Mrfs(n,2)/n
        Perr=sqrt((Mrfs(n,2)-Mrfs(n-1,2))^2)
        Mrfs(n,3)=Perr 
        disp(Mrfs(n,2),Mrfs(n,3),n)
    end
    rf=Mrfs(2,2)
    Perr=Mrfs(2,3)
    for j=2:n
        if(Mrfs(n,3)<Perr)
            rf=Mrfs(n,2)
            Perr=Mrfs(n,3)
        end
    end
    disp('lista rfs')
    disp(Mrfs(n,2),Mrfs(n,3),n)
endfunction
