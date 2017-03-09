int x = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (x > 10) {
    x = 0;
  }
  Serial.print(x);
  delay(1);
}
