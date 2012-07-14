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
 * 06/17/10    Andrew Sylvester    Initial authoring.
 * 06/30/10    Deepak Patil        Changes for library compatibility
 */

/*
 * Currently goes forward when set to reverse I will keep it this way so
 * that it works propperly when the base library is fixed 
 */

#include <Wire.h>               // Needs to be included here for //
                                // the NXTI2CDevice to work      //
#include <NXTI2CDevice.h>
#include <PFMate.h>

PFMate          pf;

void
setup()
{
  Serial.begin(9600);         // start serial for output

  char            str[40];

  delay(1000);
  pf.controlMotor(PF_Channel_4,	          // PF_Channel_1, 2, 3, or 4
                  PF_Contol_Both,         // PF_Contol_Both, A, or B
                  PF_Operation_Forward,   // PF_Operation_Forward, Reverse, Float, or Brake
                  PF_Speed_Full);         // [1, 7] or PF_Speed_Full, Medium, or Slow
  pf.sendSignal();
  delay(1000);                  
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

