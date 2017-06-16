void setup() {
  // put your setup code here, to run once:
 pinMode(2,OUTPUT);
 pinMode(3,OUTPUT);
 pinMode(5,OUTPUT);
 pinMode(6,OUTPUT);
 digitalWrite(5,LOW);
 digitalWrite(6,HIGH);
}

void loop() {
// put your main code here, to run repeatedly:
  digitalWrite(2,HIGH);
 
  delay(150);
  digitalWrite(2,LOW);
delay(500);

//digitalWrite(3,HIGH);
 
  //delay(150);
  //digitalWrite(3,LOW);
//delay(1000);

}
