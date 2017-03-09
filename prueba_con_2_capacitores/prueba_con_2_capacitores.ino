  int cap1= A0;
  int cap2= A1;
  int tresvoltios=600;
  int unvoltio=600;
  int minimo=400;
  int activa1=4;
  int activa2=2;
  int sensorValueC1=0;
  int sensorValueC2=0;
void setup() {
  // put your setup code here, to run once:
   pinMode(activa1, OUTPUT);
   pinMode(activa2, OUTPUT);
    digitalWrite(activa1,HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:
  sensorValueC1 = analogRead(cap1);
  sensorValueC2 = analogRead(cap2);  
  if(sensorValueC1>tresvoltios){
    digitalWrite(activa1,LOW);
  }
  if(sensorValueC2<minimo){
    digitalWrite(activa2,HIGH);
  }
  if(sensorValueC2>unvoltio){
    digitalWrite(activa2,LOW);
  }
  delay(10);
}
