/************************************************************************/
/*                                                                 
	Copyright (c) 2010 by mindsensors.com                                
	Email: info (<at>) mindsensors (<dot>) com                          
                                                                    
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

************************************************************************/

/*  History
* When        Who                 Comments
* 06/08/10    Andrew Sylvester    Initial authoring.
*/

#include <Wire.h>               // needs to be included here for the
                                // NXTI2CDevice to work
#include <NXTI2CDevice.h>
#include <NXTMMX.h>

NXTMMX          mmx;

void
setup()
{
    Serial.begin(9600);         // start serial for output
    delay(2000);                // wait two seconds, allowing time to
                                // activate the serial monitor
    mmx.reset();                // resets the encoder positions to zero

    char            str[40];

    // Drive motor 1 forward and motor 2 backward unlimited
    delay(1000);
    sprintf(str, "Motor 1 Forward and Motor 2 Backward Unlimited");
    Serial.println(str);
    str[0] = '\0';
    mmx.runUnlimited(MMX_Motor_1, 
                     MMX_Direction_Forward, 
                     MMX_Speed_Slow);
    mmx.runUnlimited(MMX_Motor_2, 
                     MMX_Direction_Reverse, 
                     MMX_Speed_Slow);

    Serial.println("Program Finished");
}

void
loop()                          // After the setup the LED blinks to show
                                // the program is complete
{
    digitalWrite(13, HIGH);     // set the LED on
    delay(1000);                // wait 
    digitalWrite(13, LOW);      // set the LED off
    delay(1000);                // wait
}
