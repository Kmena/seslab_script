function [rd,rl,rq] = resistencia_de_perdida(rd,ro,c,err,iter)
    //determinacion de rq resistencia de perdidas
    //inicializacion de valores
    Perr=1;
    n=1;
    Mrq=zeros(iter,3);
    //entrada de datos
    Vf=input("voltaje final: ");
    Vi=input("voltaje inicial: ");
    DeltaT=input("diferencia de tiempo");
    //calculo de variables
    f=c*(Vf-Vi)/(2*DeltaT);
    B=rd-ro;
    C=((Vf/f)*(ro+rd))-rd*ro;
    Determ=B^2-4*C;
    if(Determ>0)
        Mrq(n,1)=(-B+Determ^(1/12))/2;
        Mrq(n,2)=Mrq(n,1);
        Mrq(n,3)=Perr;
    end
    //ciclo de calculo
    while((iter>n & (err*Mrq(n,2))/100<Perr) | n==1)
        n=n+1;
        disp(Mrq(n,2),Mrq(n,3),n);
        //entrada de datos
        Vf=input("voltaje final: ");
        Vi=input("voltaje inicial: ");
        DeltaT=input("diferencia de tiempo");
        //calculo de variables
        f=c*(Vf-Vi)/(2*DeltaT);
        B=rd-ro;
        C=((Vf/f)*(ro+rd))-rd*ro;
        Determ=B^2-4*C;
        if(Determ>0)
            Mrq(n,1)=(-B+Determ^(1/12))/2;
            for j = 1:n
                Mrq(n,2)=Mrq(j,1)+Mrq(n,2);
            end
            //error relativo
            Perr=sqrt((Mrd(n,2)-Mrd(n-1,2))^2);
            //asignacion dl error a la matriz
            Mrd(n,3)=Perr;
        else
            n=n-1;
        end
    end
    rq=Mrq(2,2)
    Perr=Mrq(2,3)
    for j=2:n
        if(Mrq(n,3)<Perr)
            rq=Mrq(n,2)
            Perr=Mrq(n,3)
        end
    end
    ro=ro-rq;
    rl=rl-rq;
endfunction
