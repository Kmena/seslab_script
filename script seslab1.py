import os
import shutil
import datetime
#generacion de una variable para que almacene la hora local
x=datetime.datetime.now()
#guarda la hora de inicio de la tarea
t1=x.hour
#ciclo infinito para ejecutar la tarea
while(true)
    #crea una lista de los archivos contenidos en la carpeta /etc/weewx/skins/Standard
    #donde se generan los skins para internet
    a=os.listdir(/etc/weewx/skins/Standard)
    #se toma la cantidad de archivos en la carpeta
    dim=len(a)
    #se recorre toda la lista
    for j in range(dim):
        #toma el tamaño de la palabra seleccionada
        pal=len(a[j])
        #recorre la palabra
        for i in range(pal):
            #busca un '.' en la pablabra seleccionada
            if(a[j][i]=="."):
                #ve si la extencion del archivo es html
                if(a[j][i+1]=="h"):
                    if(a[j][i+2]=="t"):
                        if(a[j][i+3]=="m"):
                            if(a[j][i+4]=="l"):
                                #copia el archivo html en la carpeta /opt/lampp/htdocs
                                #donde se guarda los paginas en xampp
                                shutil.copy("/etc/weewx/skins/Standard"+a[j],"/opt/lampp/htdocs"+a[j])
                #ve si la extencion es php
                elif (a[j][i+1]=="p"):
                    if(a[j][i+2]=="h"):
                        if(a[j][i+3]=="p"):
                            #copia el archivo html en la carpeta /opt/lampp/htdocs
                            #donde se guarda los paginas en xampp
                            shutil.copy("/etc/weewx/skins/Standard"+a[j],"/opt/lampp/htdocs"+a[j])
    #guarda la hora actual en t2                            
    t2=x.hour
    #pregunta si la hora cambio
    while(t2==t1):
        #espera un minuto
        time.sleep(60)
        #actualiza la hora
        t2=x.hour
    #se actualiza t1 a la hora actual
    t1=t2
        
        
