int counter =1;
void setup() {
        // Se establece la conexión serial
	Serial.begin(9600);
}
 
void loop(){
    if(counter == 1){
      Serial.println("arduino conectado");
      counter++;
      delay(1000);
    }
    delay(1000);
    while(Serial.available()){
      delay(30);
      String c=Serial.readStringUntil('\n');
      delay(1000);
      counter++;
    }
}
