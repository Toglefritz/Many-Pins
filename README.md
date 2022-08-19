# Many Pins

A tool for tinkering with a microcontroller board's GPIO pins via serial.

## What is this thing?

Perhaps you're prototyping a new electronics project, perhaps you're building a fancy robot, perhaps
you're developing a new IoT widget, perhaps you're just learning or messing around. In any case, 
while designing, programming, testing, and debugging hardware products, it can be useful to have a
simple tool for bypassing all the layers and all the UI and all the business requirements for your
application and just simply performing read/write operations on the microcontroller's GPIO pins.

**Many Pins** is a desktop application that allows you to set the state of the GPIO pins on your
microcontroller (for supported models at least) or read values from them. The app communicates with
your microcontroller board over Serial. Bespoke firmware running on the microcontroller will
receive the serial communication and either set the digital or analog state of a target GPIO pin
or send back the digital or analog read value from a target GPIO pin.
