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

/***************************************************************
 IMPORTANT:
 Make sure that the powermeter is grounded with the device it is measuring.
 Refer to User Guide located at following URL for more information.
 http://www.mindsensors.com/index.php?module=documents&JAS_DocumentManager_op=viewDocument&JAS_Document_id=142
***************************************************************/


#include <Wire.h>               // Needs to be included here for //
                                // the NXTI2CDevice to work      //
#include <NXTI2CDevice.h>
#include <NXTPowerMeter.h>

NXTPowerMeter     pwr;

int current;
void
setup()
{
    Serial.begin(9600);         // start serial for output
    
    pwr.resetCounters();
}
   
void
loop()
{
    current = pwr.readPresentCurrent();
    Serial.print("Current: "); Serial.println(current);
    Serial.print("Voltage: "); Serial.println(pwr.readPresentVoltage());
    Serial.print("Power: "); Serial.println(pwr.readCapacityUsed());
    Serial.print("Time: "); Serial.println(pwr.readElapsedTime());
    delay(250);
}
