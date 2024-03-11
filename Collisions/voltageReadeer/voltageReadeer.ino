const int sensorPins[] = {A0, A1, A2, A3, A4
//, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14
};
const int numSensors = sizeof(sensorPins) / sizeof(sensorPins[0]);
float sensorValues[numSensors];
float voltages[numSensors];
bool tripped;
int numTripped;

void setup() {
  // start the serial communication
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() {
  tripped = false;
  for (int i = 0; i < numSensors; i++) {
    // read the input on analog pin
    sensorValues[i] = analogRead(sensorPins[i]);
    // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V)
    voltages[i] = sensorValues[i] * (5.0 / 1023.0);
    // print out the value in volts
    Serial.print("Voltage at A");
    Serial.print(i);
    Serial.print(": ");
    Serial.println(voltages[i]);
    // check if voltage is less than 1.85
    if (voltages[i] < 1.85) {
      tripped = true;
      //break;  
    }
  }
  Serial.print("Trip Status: ");
  Serial.println(tripped ? "Tripped" : "Not Tripped");

  if(tripped){
    digitalWrite(13, HIGH);  // activate the alarm
    numTripped++;
    delay(1000);
    digitalWrite(13, LOW);  // deactivate the alarm
    Serial.print("Number of trips: ");
    Serial.println(numTripped);
  }

  // delay before the next reading
  delay(1000);
}