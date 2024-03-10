bool tripped;
float voltage;
float voltage2;
float voltage3;
float voltage4;
float voltage5;
int sensorValue;
int sensorValue2;
int sensorValue3;
int sensorValue4;
int sensorValue5;

void setup() {
  // start the serial communication
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  
}

void loop() {
  // read the input on analog pin A0
   sensorValue = analogRead(A0);
   sensorValue2 = analogRead(A1);
   sensorValue3 = analogRead(A2);
   sensorValue4 = analogRead(A3);
   sensorValue5 = analogRead(A4);
  // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V)
   voltage = sensorValue * (5.0 / 1023.0);
   voltage2 = sensorValue2 * (5.0 / 1023.0);
   voltage3 = sensorValue3 * (5.0 / 1023.0);
   voltage4 = sensorValue4 * (5.0 / 1023.0);
   voltage5 = sensorValue5 * (5.0 / 1023.0);
  // print out the value in volts
  Serial.print("Voltage at A0: ");
Serial.println(voltage);
Serial.print("Voltage at A1: ");
Serial.println(voltage2);
  Serial.print("Voltage at A2: ");
Serial.println(voltage3);
Serial.print("Voltage at A3: ");
Serial.println(voltage4);
Serial.print("Voltage at A4: ");
Serial.println(voltage5);


  if(voltage < 1.85 || voltage2 < 1.85 || voltage3 < 1.85 || voltage4 < 1.85 || voltage5 < 1.85){
    tripped = true;
}
Serial.print("Trip Status: ");
Serial.println(tripped);

  if(tripped){
    digitalWrite(13, HIGH);
    // activate the alarm
  }

  // delay before the next reading
  delay(1000);
}