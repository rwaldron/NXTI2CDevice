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
 * 06/22/10    Andrew Sylvester    Initial authoring.
 * 06/30/10    Deepak Patil        Changes for library compatibility
 */

#include <Wire.h>               // Needs to be included here for //
                                // the NXTI2CDevice to work //
#include <NXTI2CDevice.h>
#include <NXTCam.h>

NXTCam          cam;
int             nblobs;
uint8_t         color[8];
uint8_t         left[8];
uint8_t         top[8];
uint8_t         bottom[8];
uint8_t         right[8];
char            str[50];

void
setup()
{

    Serial.begin(9600);         // start serial for outpu

    cam.selectObjectMode();
    cam.sortSize();
    cam.enableTracking();
    delay(1000);


}

void
loop()
{
    delay(1000);
    cam.getBlobs(&nblobs, color, left, top, right, bottom);
    Serial.println(nblobs);
    for (int i = 0; i < nblobs; i++) {
        sprintf(str, "color[%d]: %d  ", (i + 1), color[i]);
        Serial.print(str);
        str[0] = '\0';
        sprintf(str, "left[%d]: %d  ", (i + 1), left[i]);
        Serial.print(str);
        str[0] = '\0';
        sprintf(str, "top[%d]: %d  ", (i + 1), top[i]);
        Serial.print(str);
        str[0] = '\0';
        sprintf(str, "right[%d]: %d  ", (i + 1), right[i]);
        Serial.print(str);
        str[0] = '\0';
        sprintf(str, "bottom[%d]: %d  ", (i + 1), bottom[i]);
        Serial.println(str);
        str[0] = '\0';
    }

}
