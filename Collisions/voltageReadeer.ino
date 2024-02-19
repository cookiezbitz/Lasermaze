bool penis;
void setup() {
  // start the serial communication
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  
}

void loop() {
  // read the input on analog pin A0
  int sensorValue = analogRead(A0);
  int sensorValue2 = analogRead(A1);
  // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V)
  float voltage = sensorValue * (5.0 / 1023.0);
  float voltage2 = sensorValue2 * (5.0 / 1023.0);
  // print out the value in volts
  Serial.print("Voltage at A0: ");
Serial.println(voltage);
Serial.print("Voltage at A1: ");
Serial.println(voltage2);

  if(voltage2 < 2.2){
    penis = true;
  }

  if(penis){
    digitalWrite(13, HIGH);
  }

  // delay before the next reading
  delay(1);
}