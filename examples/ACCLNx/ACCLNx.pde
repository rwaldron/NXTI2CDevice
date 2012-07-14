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

#include <Wire.h>               // Needs to be included here for //
                                // the NXTI2CDevice to work      //
#include <NXTI2CDevice.h>
#include <ACCLNx.h>

ACCLNx          accl;

short           xtilt;
short           ytilt;
short           ztilt;
int             xaccl;
int             yaccl;
int             zaccl;

void
setup()
{
    Serial.begin(9600);         // start serial for output

}

void
loop()
{
    delay(1000);

    xtilt = accl.getXTilt();
    Serial.print("X Tilt:");
    Serial.println(xtilt);
    ytilt = accl.getYTilt();
    Serial.print("Y Tilt:");
    Serial.println(ytilt);
    ztilt = accl.getZTilt();
    Serial.print("Z Tilt:");
    Serial.println(ztilt);

    xaccl = accl.getXAccl();
    Serial.print("X Acceleration:");
    Serial.println(xaccl);
    yaccl = accl.getYAccl();
    Serial.print("Y Acceleration:");
    Serial.println(yaccl);
    zaccl = accl.getZAccl();
    Serial.print("Z Acceleration:");
    Serial.println(zaccl);
    Serial.println();

}
