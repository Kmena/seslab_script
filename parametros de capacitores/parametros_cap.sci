function [rd,rl,ld] = parametros_cap(rf,rfs,rp,ro,c,iter,err)
    //determinacion de rd
    rprc=(rp*ro)/(ro+rp);//paralelo de la resistencia del dielectrico y resistencia de osciloscopio
    //inicializacion de valores
    Perr=1;
    n=1;
    Mrd=zeros(iter,3);
    //entrada de datos medidos del voltaje del capacitor (delta y voltaje final) y voltaje de resistencia
    //V1=input('voltaje de medicion inicial de capacitor: ');
    V2=input('voltaje final del capacitor: ');
    //T=input('tiempo entre medicion: ');
    If=input('corriente de la fuente: ');
    //calculos
    //deltarc=(V2-V1)/T; //delta vc
    Ri=V2/If;
    Mrd(n,1)=(ro*Ri)/(ro-Ri);//calculo de ri
    Mrd(n,2)=Mrd(n,1);//inicializacion del promedio con el primer valor de ri
    Mrd(n,3)=Perr;//primer error en 1
    //ciclo de calculo de ri
    while((iter>n & (err*Mrd(n,2))/100<Perr) | n==1)
        disp(Mrd(n,2),Mrd(n,3));
        n=n+1//aumento del contador
        //entrada de datos medidos del voltaje del capacitor (delta y voltaje final) y voltaje de resistencia
        V2=input('voltaje final del capacitor: ');
        //T=input('tiempo entre medicion: ');
        If=input('corriente de la fuente: ');
        //calculos
        //deltarc=(V2-V1)/T; //delta vc
        Ri=V2/If;
        Mrd(n,1)=(ro*Ri)/(ro-Ri);//calculo de ri
        //calculo del promedio de ri's calculadas
        for j = 1:n
            Mrd(n,2)=Mrd(j,1)+Mrd(n,2);
        end
        Mrd(n,2)=Mrd(n,2)/n;
        //error relativo
        Perr=sqrt((Mrd(n,2)-Mrd(n-1,2))^2);
        //asignacion dl error a la matriz
        Mrd(n,3)=Perr;
    end
    //selector del promedio con menor error
    rd=Mrd(2,2)
    Perr=Mrd(2,3)
    for j=2:n
        if(Mrd(n,3)<Perr)
            rd=Mrd(n,2)
            Perr=Mrd(n,3)
        end
    end
    disp('Rd listo',rd,Mrd(n,3));
    
    //calculo de rl, esta medicion debe hacer a la mayor frecuencia posible para minimizar el efecto de l y c
    Perr=1;
    n=1;
    Mrl=zeros(iter,3);
    Rin=rfs+rp;
    //entrada de datos
    Vf=input('voltaje fuente ');
    Vm=input('voltaje medido ');
    //calculos
    I=((Vf-Vm)/Rin)-(Vm/ro);
    Mrl(n,1)=Vm/I;
    Mrl(n,2)=Mrl(n,1);
    Mrl(n,3)=Perr;
    //ciclo de calculo
    while((iter>n & (err*Mrl(n,2))/100<Perr) | n==1)
        disp(Mrl(n,2),Mrl(n,3));
        n=n+1//aumento del contador
        //entrada de datos
        Vf=input('voltaje fuente ');
        Vm=input('voltaje medido ');
        //calculos
        I=((Vf-Vm)/Rin)-(Vm/ro);
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
    
    //calculo de ld, esta medicion debe con cambios de voltajes muy pequeños para evitar errores de derivada
    Perr=1;
    n=1;
    Mld=zeros(iter,3);
    Rin=rf+rp;
    //entrada de datos
    Vf1=input('voltaje fuente 1 ');
    Vm1=input('voltaje medido 1 ');
    Vf2=input('voltaje fuente 2 ');
    Vm2=input('voltaje medido 2 ');
    DeltaT=input('diferencia de tiempo: ');
    //calculos
    I1=((Vf1-Vm1)/Rin)-(Vm1/ro);
    I2=((Vf2-Vm1)/Rin)-(Vm2/ro);
    DI=I1/I2;
    Mld(n,1)=(rl*DeltaT)/(1-DI+rl*DeltaT);
    Mld(n,2)=Mrl(n,1);
    Mld(n,3)=Perr;
    //ciclo de calculo
    while((iter>n & (err*Mld(n,2))/100<Perr) | n==1)
        disp(Mld(n,2),Mld(n,3));
        n=n+1//aumento del contador
        //entrada de datos
        Vf1=input('voltaje fuente 1 ');
        Vm1=input('voltaje medido 1 ');
        Vf2=input('voltaje fuente 2 ');
        Vm2=input('voltaje medido 2 ');
        DeltaT=input('diferencia de tiempo: ');
        //calculos
        I1=((Vf1-Vm1)/Rin)-(Vm1/ro);
        I2=((Vf2-Vm1)/Rin)-(Vm2/ro);
        DI=I1/I2;
        Mld(n,1)=(rl*DeltaT)/(1-DI+rl*DeltaT);
        for j = 1:n
            Mld(n,2)=Mld(j,1)+Mld(n,2);
        end
        Mld(n,2)=Mld(n,2)/n;
        //error relativo
        Perr=sqrt((Mld(n,2)-Mld(n-1,2))^2);
        //asignacion dl error a la matriz
        Mld(n,3)=Perr;
    end
    //selector del promedio con menor error
    ld=Mrd(2,2)
    Perr=Mld(2,3)
    for j=2:n
        if(Mld(n,3)<Perr)
            ld=Mrd(n,2)
            Perr=Mld(n,3)
        end
    end
    disp(ld,Perr,n);
    
endfunction
