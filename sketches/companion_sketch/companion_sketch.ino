#include <ArduinoJson.h>
#include <ArduinoJson.hpp>

/*
  Many Pins
  Companion Sketch

  Author: Scott Hatfield

  Many Pins is a tool for tinkering with a microcontroller board's GPIO pins
  via serial. The Many Pins Windows app connects to a target microcontroller
  via serial communication. The app sends commands to perform read/write
  operations on the microcontroller's GPIO pins. When necessary, the
  microcontroller responds to commands.
*/

/*
  Commands sent to the board are JSON-formatted strings with the following
  content for performing write operations:

    {
      "pin": 1,
      "cmd": "write",
      "params": "digital",
      "value": "high"
    }

    or, for performing read operations:

    {
      "pin": 1,
      "cmd": "read",
      "params": "digital"
    }

   In response to write commands, the program will send a serial message back
   indicating a success or failure a boolean:

    {
      "result": true
    }

   or, in response to read operations, the program will return the value of the
   digitalRead or analogRead command. For analog reads, the int value of the
   read will be returned and for digital reads, a String value of "high" or
   "low" will be returned:

    {
      "result": 255
    }

    or

    {
      "result": "low"
    }
*/

/// CONFIGURATION
#define DEBUG true

/// Provides initial configuration for the sketch
void setup() {
  Serial.begin(9600);
  while (!Serial) continue;
}

/// Sends prints over serial when debugging is enabled with carriage returns
void debugPrintln(String message) {
  if (DEBUG) {
    Serial.println(message);
  }
}

/// Sends prints over serial when debugging is enabled
void debugPrint(String message) {
  if (DEBUG) {
    Serial.print(message);
  }
}

/// In response to an analog read command received over serial, performs the requested
/// read operation and returns the result to be sent back via serial
void processAnalogReadCommand(int pinNumber) {
  debugPrintln("Processing analog read command");

  // Set the pinMode for the target pin
  pinMode(pinNumber, OUTPUT);

  // Perform the analogRead to get the int value
  int readValue = analogRead(pinNumber);

  // Create a JSON string to send back over serial
  DynamicJsonDocument reaponseJson(24);
  reaponseJson["result"] = readValue;
  serializeJson(reaponseJson, Serial);
}

/// In response to a digital read command received over serial, performs the requested
/// read operation and returns the result to be sent back via serial
void processDigitalReadCommand(int pinNumber) {
  debugPrintln("Processing digital read command");

  // Set the pinMode for the target pin
  pinMode(pinNumber, OUTPUT);

  // Perform the analogRead to get the int value
  int readValue = digitalRead(pinNumber);

  // Create a JSON string to send back over serial
  DynamicJsonDocument reaponseJson(24);
  reaponseJson["result"] = readValue;
  serializeJson(reaponseJson, Serial);
}

/// In response to an analog write command received over serial, performs the requested
/// write operation and returns the result, containing a boolean for success/failure ia serial
void processAnalogWriteCommand(int pinNumber, int value) {
  debugPrintln("Processing analog write command");

  // Set the pinMode for the target pin
  pinMode(pinNumber, INPUT);

  // Perform the analogWRite command
  analogWrite(pinNumber, value);

  // Create a JSON string to send back over serial
  DynamicJsonDocument reaponseJson(24);
  reaponseJson["result"] = true;
  serializeJson(reaponseJson, Serial);
}

/// In response to a digital write command received over serial, performs the requested
/// write operation and returns the result, containing a boolean for success/failure ia serial
void processDigitalWriteCommand(int pinNumber, String value) {
  debugPrintln("Processing digital write command");

  // Set the pinMode for the target pin
  pinMode(pinNumber, INPUT);

  // Perform the analogWRite command
  digitalWrite(pinNumber, value == "high" ? HIGH : LOW);

  // Create a JSON string to send back over serial
  DynamicJsonDocument reaponseJson(24);
  reaponseJson["result"] = true;
  serializeJson(reaponseJson, Serial);
}

/// Runs consecutively, repeatedly for the live of the program
void loop() {
  // Wait for a message to become available over the serial connection
  if (Serial.available()) {
    // Pause to make sure the full command has been received
    delay(100);

    // Read the command sent over serial
    String command = Serial.readString();

    debugPrintln("");
    debugPrint("Received command: ");
    debugPrintln(command);
  

        // Allocate memory for the JSON deserialization
    StaticJsonDocument<96> doc;

    // Read an deserialize the message
    DeserializationError err = deserializeJson(doc, command);

    // Check that the deserialization was successful
    if (err == DeserializationError::Ok) {
      debugPrintln("Successfully deserialized command");

      // Check if this is a read command
      if (doc["cmd"] == "read") {
        if (doc["params"] == "analog") {
          debugPrintln("Recognized analog read command");

          // Send the response to the analog read command
          processAnalogReadCommand(doc["pin"]);
        }
        else if (doc["params"] == "digital") {
          debugPrintln("Recognized digital read command");

          // Send the response to the digital read command
          processDigitalReadCommand(doc["pin"]);
        }
      }
      // Check if this is a write command
      else if (doc["cmd"] == "write") {
        debugPrintln("Received write command");
        if (doc["params"] == "analog") {
          debugPrintln("Recognized analog write command");

          // Send the response to the analog write command
          processAnalogWriteCommand(doc["pin"], doc["value"]);
        }
        else if (doc["params"] == "digital") {
          debugPrintln("Recognized digital write command");

          // Send the response to the digital write command
          processDigitalWriteCommand(doc["pin"], doc["value"]);
        }
      }
      // The command was not recognized
      else {
        debugPrintln("Failed to recognize command");
      }
    }

    // Clear the serial buffer
    debugPrintln("");
    while (Serial.available() > 0)
        Serial.read();
  }
}