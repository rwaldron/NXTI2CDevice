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

    int             degrees = 360;  // Define variable degrees and set
                                    // equal to 360
    char            str[50];

    // Drive motors forward 360 degrees then brake
    sprintf(str, "Both Motors Forward %d Degrees then Brake", degrees);
    Serial.println(str);
    str[0] = '\0';
    mmx.runDegrees(MMX_Motor_Both, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Full,
                   degrees, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Brake);
    delay(3000);

    // Drive motors forward 360 degrees then float
    sprintf(str, "Both Motors Forward %d Degrees then Float", degrees);
    Serial.println(str);
    str[0] = '\0';
    mmx.runDegrees(MMX_Motor_Both, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Full,
                   degrees, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);
    delay(3000);

    // Drive motors forward 360 degrees then brake hold
    sprintf(str, "Both Motors Forward %d Degrees then Brake Hold", degrees);
    Serial.println(str);
    str[0] = '\0';
    mmx.runDegrees(MMX_Motor_Both, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Full,
                   degrees, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);
    delay(3000);

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
