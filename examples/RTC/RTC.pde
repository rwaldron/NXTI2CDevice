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
 * 06/15/10    Andrew Sylvester    Initial authoring.
 * 06/30/10    Deepak Patil        Changes for library compatibility
*/

#include <Wire.h>               // Needs to be included here for //
                                // the NXTI2CDevice to work      //
#include <NXTI2CDevice.h>
#include <RTC.h>

RTC     rtc;

void
setup()
{
    Serial.begin(9600);         // start serial for output
}
   
void
loop()
{
  char str[50]; 
    sprintf (str, 
    "Date & time: %.2d-%.2d-%.2d, %.2d:%.2d:%.2d", 
            rtc.getMonth(), rtc.getDayMonth(), rtc.getYear(),            
            rtc.getHours(), rtc.getMinutes(), rtc.getSeconds());
    Serial.println(str);

  delay(1000);
}
