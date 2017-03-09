#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
import time
import serial
import struct

# Iniciando conexión serial
arduino = serial.Serial('COM8', 9600, timeout=5)
time.sleep(1)

print("enviando")
cont=1
arduino.flush()
while 1:
    if(cont==1):
        dato_recibido=arduino.readline()
        time.sleep(1)
        print (dato_recibido)
        cont=cont+1
    time.sleep(1)
    if(cont==2):
        var=(str("Enviado"))
        arduino.write(var)
        time.sleep(2)
