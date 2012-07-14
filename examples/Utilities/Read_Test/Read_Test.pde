/************************************************************************/
/*                                                                      */
/* Copyright (c) 2010 by mindsensors.com                                */
/* Email: info (<at>) mindsensors (<dot>) com                           */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; version 3 of the License.              */
/* Read the license at: http://www.gnu.org/licenses/gpl.txt             */
/*                                                                      */
/************************************************************************/

/*
 * When        Who                 Comments
 * 05/29/10    Deepak Patil        Initial writing to test i2c read functionality.
 * 06/08/10    Andrew Sylvester    Modification of Read Test for NXT Header.
 */
 
#include <Wire.h>
#include <NXTI2CDevice.h>  // Needs to be included here for //
                           // the NXTI2CDevice to work      //
void setup() //Setup initiates once at start
{
  char str[50];  //Initialize variables
  bool status=true;
  char * str2;
 

  Serial.begin(9600);  //Start Communication with the Aurduio at 96000 baud (speed)
  
  NXTI2CDevice mid(0x06);   // supply correct I2C address.
  sprintf (str, "Read functions test");
  Serial.println(str);
  str[0] = '\0';
          
	sprintf (str, "Found:");
	Serial.print(str);  // Print found if a device is found at this adress
	str[0] = '\0';
	str2 = mid.getDeviceID();
	Serial.println(str2);       
	Serial.print("Version: "); 
	str2 = mid.getFirmwareVersion();
	Serial.println(str2);
	Serial.print("Vendor: ");
	str2 = mid.getVendorID();
	Serial.println(str2);             
	Serial.println("------------------");

}

void loop() //After the setup the LED blinks to show the program is complete
{
  digitalWrite(13, HIGH);   // set the LED on
  delay(1000);                  // wait 
  digitalWrite(13, LOW);    // set the LED off
  delay(1000);                  // wait
}

