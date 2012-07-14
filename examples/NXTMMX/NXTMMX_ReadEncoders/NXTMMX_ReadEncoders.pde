
#include <Wire.h>               // needs to be included here for the
                                // NXTI2CDevice to work
#include <NXTI2CDevice.h>
#include <NXTMMX.h>

NXTMMX          mmx;

void
setup()
{
    mmx.reset();                // resets the encoder positions to zero

    // Establish a serial connection to the computer
    Serial.begin(9600);         // start serial for output
    delay(2000);                // wait two seconds, allowing time to
                                // activate the serial monitor

    Serial.print("Vendor:  ");
    Serial.println(mmx.getVendorID());
    Serial.print("Device:  ");
    Serial.println(mmx.getDeviceID());
    Serial.print("Version: ");
    Serial.println(mmx.getFirmwareVersion());
    Serial.println();
}

void
loop()
{
    delay(250);
    Serial.print("M1 pos: ");
    Serial.print(mmx.getEncoderPosition(MMX_Motor_1));
    Serial.print("   M2 pos: ");
    Serial.print(mmx.getEncoderPosition(MMX_Motor_2));
    Serial.println();
}
