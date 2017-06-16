void setup() {
  // put your setup code here, to run once:
Serial.begin(19200); // Default connection rate for my BT module
 pinMode(2,OUTPUT);

}




void loop() {
  // put your main code here, to run repeatedly:
  byte  state;
   digitalWrite(2,HIGH);
  delay(150);
  digitalWrite(2,LOW);


  if(Serial.available() > 0){
    
      state = Serial.read();
      Serial.print("The number of output pulses is: ");
      Serial.println(int(state));
      }
        delay(500);

}
