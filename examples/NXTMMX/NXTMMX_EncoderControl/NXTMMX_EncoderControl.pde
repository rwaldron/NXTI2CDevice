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
    delay(1000);                // wait one second, allowing time to
                                // activate the serial monitor
    mmx.reset();                // resets the encoder positions to zero

    long            target = 1260;  // Define target to 1260
    int             degrees1;
    int             degrees2;
    char            str[60];
    int             p1;
    int             p2;

    // Drive both motors to a specific position
    Serial.println("Change the positions");
    delay(10000);
    p1 = mmx.getEncoderPosition(MMX_Motor_1);
    p2 = mmx.getEncoderPosition(MMX_Motor_2);
    Serial.print("M1 pos: ");
    Serial.print(p1);
    Serial.print("   M2 pos: ");
    Serial.print(p2);
    Serial.println();
    sprintf(str, "Motors to Target Position %d ", target);
    Serial.println(str);
    str[0] = '\0';
    degrees1 = target - p1;
    degrees2 = target - p2;
    Serial.print("Turn Motor 1 ");
    Serial.print(degrees1);
    Serial.println(" degrees to reach target position");
    Serial.print("Turn Motor 2 ");
    Serial.print(degrees2);
    Serial.println(" degrees to reach target position");
    mmx.runDegrees(MMX_Motor_1, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Medium,
                   degrees1, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);
    mmx.runDegrees(MMX_Motor_2, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Medium,
                   degrees2, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);

    // A second check that gets the motor closer to the target position
    p1 = mmx.getEncoderPosition(MMX_Motor_1);
    p2 = mmx.getEncoderPosition(MMX_Motor_2);
    degrees1 = target - p1;
    degrees2 = target - p2;
    mmx.runDegrees(MMX_Motor_1, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Medium,
                   degrees1, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);
    mmx.runDegrees(MMX_Motor_2, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Medium,
                   degrees2, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);

    p1 = mmx.getEncoderPosition(MMX_Motor_1);
    p2 = mmx.getEncoderPosition(MMX_Motor_2);

    Serial.print("M1 pos: ");
    Serial.print(p1);
    Serial.print("   M2 pos: ");
    Serial.print(p2);
    Serial.println();

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
