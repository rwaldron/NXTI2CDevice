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

    int             seconds = 3;    // Define variable seconds and set
                                    // equal to 3
    char            str[40];

    // Drive motor 1 forward and backward for a specific number of seconds
    delay(1000);
    sprintf(str, "Motor 1 Forward %d Seconds", seconds);
    Serial.println(str);
    str[0] = '\0';
    mmx.runSeconds(MMX_Motor_1, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);
    delay(1000);
    sprintf(str, "Motor 1 Reverse %d Seconds", seconds);
    Serial.println(str);
    str[0] = '\0';
    mmx.runSeconds(MMX_Motor_1, 
                   MMX_Direction_Reverse, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);

    // Drive motor 2 forward and backward for a specific number of seconds
    delay(1000);
    sprintf(str, "Motor 2 Forward %d Seconds", seconds);
    Serial.println(str);
    str[0] = '\0';
    mmx.runSeconds(MMX_Motor_2, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);
    delay(1000);
    sprintf(str, "Motor 2 Reverse %d Seconds", seconds);
    Serial.println(str);
    str[0] = '\0';
    mmx.runSeconds(MMX_Motor_2, 
                   MMX_Direction_Reverse, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);

    // Drive both motors forward and backward for a specific number of
    // seconds
    delay(1000);
    sprintf(str, "Both Motors Forward %d Seconds", seconds);
    Serial.println(str);
    str[0] = '\0';
    mmx.runSeconds(MMX_Motor_Both, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);
    delay(1000);
    sprintf(str, "Both Motors Reverse %d Seconds", seconds);
    Serial.println(str);
    str[0] = '\0';
    mmx.runSeconds(MMX_Motor_Both, 
                   MMX_Direction_Reverse, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);

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
