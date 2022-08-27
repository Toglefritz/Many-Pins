#include <Arduino_JSON.h>

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
      "pin_number": 1,
      "cmd": "write",
      "params": "digital",
      "value": "high"
    }

    or, for performing read operations:

    {
      "pin_number": 1,
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
  Serial.begin(115200);  // Set up Serial library at 115200 bps
}

/// Sends prints over serial when debugging is enabled
void debugPrint(String message) {
  if(DEBUG) {
    Serial.println(message);
  }
}

/// Verifies that JSON received in the serial message conforms to the expected
/// format by checking that the message contains the expected fields
bool verifySchema(JSONVar message) {
  if (message.hasOwnProperty("pin_number") && message.hasOwnProperty("cmd") &&
      message.hasOwnProperty("params")) {
    return true;
  } else {
    return false;
  }
}

/// In response to an analog read command received over serial, performs the requested
/// read operation and returns the result to be sent back via serial
String processAnalogReadCommand(int pinNumber) {
  debugPrint("DEBUG processing analog read command");
  
  // Set the pinMode for the target pin
  pinMode(pinNumber, OUTPUT);
  
  // Perform the analogRead to get the int value
  int readValue = analogRead(pinNumber);

  // Create a JSON string to send back over serial
  JSONVar reaponseJson;
  reaponseJson["result"] = readValue;
  String response = JSON.stringify(reaponseJson);

  return response;
}

/// In response to a digital read command received over serial, performs the requested
/// read operation and returns the result to be sent back via serial
String processDigitalReadCommand(int pinNumber) {
  debugPrint("DEBUG processing digital read command");
  
  // Set the pinMode for the target pin
  pinMode(pinNumber, OUTPUT);
  
  // Perform the analogRead to get the int value
  int readValue = digitalRead(pinNumber);

  // Create a JSON string to send back over serial
  JSONVar reaponseJson;
  reaponseJson["result"] = readValue;
  String response = JSON.stringify(reaponseJson);

  return response;
}

/// In response to an analog write command received over serial, performs the requested
/// write operation and returns the result, containing a boolean for success/failure ia serial
String processAnalogWriteCommand(int pinNumber, int value) {
  debugPrint("DEBUG processing analog write command");
  
  // Set the pinMode for the target pin
  pinMode(pinNumber, INPUT);
  
  // Perform the analogWRite command 
  analogWrite(pinNumber, value);

  // Create a JSON string to send back over serial
  JSONVar reaponseJson;
  reaponseJson["result"] = true;
  String response = JSON.stringify(reaponseJson);

  return response;
}

/// In response to a digital write command received over serial, performs the requested
/// write operation and returns the result, containing a boolean for success/failure ia serial
String processDigitalWriteCommand(int pinNumber, String value) {
  debugPrint("DEBUG processing digital write command");
  
   // Set the pinMode for the target pin
  pinMode(pinNumber, INPUT);
  
  // Perform the analogWRite command 
  digitalWrite(pinNumber, value == "high" ? HIGH : LOW);

  // Create a JSON string to send back over serial
  JSONVar reaponseJson;
  reaponseJson["result"] = true;
  String response = JSON.stringify(reaponseJson);

  return response;
}

/// Runs consecutively, repeatedly for the live of the program
void loop() {
  // Wait for a message to become available over the serial connection
  if (Serial.available()) {
    String messageContents = Serial.readString();  // Read the serial message

    debugPrint("\nDEBUG received serial message");

    JSONVar messageJson = JSON.parse(messageContents);  // Get a JSONVar object from the message received

    // Make sure the serial message the expected fields
    if (verifySchema(messageJson)) {
      debugPrint("DEBUG serial command verified");
      
      // Check if this is a read command
      if ((const char*) messageJson["cmd"] == "read") {
        // Check if this is an analog read command
        if ((const char*) messageJson["params"] == "analog") {
          // Get the response to the analog read command
          String response = processAnalogReadCommand((int) messageJson["pin_number"]);

          // Send the response back over serial
          Serial.println(response);
        }
        // The command is a digital read command 
        else {
          // Get the response to the digital read command
          String response = processDigitalReadCommand((int) messageJson["pin_number"]);

          // Send the response back over serial
          Serial.println(response);
        }
      }
      // The command is a write command
      else {
        // Check if this is an analog read command
        if((const char*) messageJson["params"] == "analog") {
          // Perform the write command
          String response = processAnalogWriteCommand((int) messageJson["pin_number"], (int)messageJson["value"]);

          // Send the response back over serial
          Serial.println(response);
        }
        // The command is a digital write command
        else {
          // Perform the write command
          String response = processDigitalWriteCommand((int) messageJson["pin_number"], (const char*) messageJson["value"]);

          // Send the response back over serial
          Serial.println(response);
        }
      }
    }
    // The format of the serial message could not be verified
    else {
      debugPrint("DEBUG failed to verify JSON payload");
      
      JSONVar errorJson;
      errorJson["error"] = "Failed to verify JSON payload";
      String error = JSON.stringify(errorJson);
      
      Serial.println(error);
    }

    Serial.flush();
  }
}
