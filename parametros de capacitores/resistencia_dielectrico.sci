function [rd] = Resistencia_ro(rp,ro,err,iter)
    rprc=(rp*ro)/(ro+rp);//paralelo de la resistencia del dielectrico y resistencia de osciloscopio
    //inicializacion de valores
    Perr=1;
    n=1;
    Mrd=zeros(iter,3);
    //entrada de datos medidos del voltaje del capacitor (delta y voltaje final) y voltaje de resistencia
    //V1=input('voltaje de medicion inicial de capacitor: ');
    V2=input('voltaje final del capacitor: ');
    //T=input('tiempo entre medicion: ');
    //V1=input('voltaje de la fuente: ');
    If=input('corriente de fuente(uA): ');
    If=If*10^-6;
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
        //V1=input('voltaje de la fuente: ');
        If=input('corriente de fuente(uA): ');
        If=If*10^-6;
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
endfunction
