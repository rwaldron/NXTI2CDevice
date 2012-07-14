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
* 06/08/10    Andrew Sylvester    Modification of original code.
*/

#include <Wire.h>               // needs to be included here for the
                                // NXTI2CDevice to work
#include <NXTI2CDevice.h>
#include <NXTMMX.h>

NXTMMX          mmx;

void
setup()
{
    mmx.reset();                // resets the encoder positions to zero

    int             seconds = 2;

    // Drive forward and backward for a specific number of seconds
    delay(1000);
    mmx.runSeconds(MMX_Motor_Both, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);
    delay(1000);
    mmx.runSeconds(MMX_Motor_Both, 
                   MMX_Direction_Reverse, 
                   MMX_Speed_Slow,
                   seconds, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_Float);

    int             degrees = 90;

    // Go forward a specific number of degrees
    delay(1000);
    mmx.runDegrees(MMX_Motor_Both, 
                   MMX_Direction_Forward, 
                   MMX_Speed_Medium,
                   degrees, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);

    // and backward the same number of degrees
    delay(1000);
    mmx.runDegrees(MMX_Motor_Both, 
                   MMX_Direction_Reverse, 
                   MMX_Speed_Medium,
                   degrees, 
                   MMX_Completion_Wait_For,
                   MMX_Next_Action_BrakeHold);
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
