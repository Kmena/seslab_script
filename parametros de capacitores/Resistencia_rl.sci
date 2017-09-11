function [rl] = Resistencia_rl(rfs,rp,ro,err,iter)
    Perr=1;
    n=1;
    Mrl=zeros(iter,3);
    Rin=rfs+rp;
    //entrada de datos
    I=input('corrient de fuente ');
    Vm=input('voltaje medido ');
    //calculos
    //I=((Vf-Vm)/Rin)-(Vm/ro);
    Mrl(n,1)=Vm/I;
    Mrl(n,2)=Mrl(n,1);
    Mrl(n,3)=Perr;
    //ciclo de calculo
    while((iter>n & (err*Mrl(n,2))/100<Perr) | n==1)
        disp(Mrl(n,2),Mrl(n,3));
        n=n+1//aumento del contador
        //entrada de datos
        I=input('Corriente de fuente ');
        Vm=input('voltaje medido ');
        //calculos
        //I=((Vf-Vm)/Rin)-(Vm/ro);
        Mrl(n,1)=Vm/I;
        for j = 1:n
            Mrl(n,2)=Mrl(j,1)+Mrl(n,2);
        end
        Mrl(n,2)=Mrl(n,2)/n;
        //error relativo
        Perr=sqrt((Mrl(n,2)-Mrl(n-1,2))^2);
        //asignacion dl error a la matriz
        Mrl(n,3)=Perr;
    end
    //selector del promedio con menor error
    rl=Mrd(2,2)
    Perr=Mrl(2,3)
    for j=2:n
        if(Mrl(n,3)<Perr)
            rl=Mrd(n,2)
            Perr=Mrl(n,3)
        end
    end
    disp('rl lista');
    disp(rl,Perr,n);
    
endfunction
