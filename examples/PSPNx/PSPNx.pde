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
*/

#include <Wire.h>              // Needs to be included here for //
                                // the NXTI2CDevice to work      //
#include <NXTI2CDevice.h>
#include <PSPNx.h>

PSPNx          psp;

  int        xljoy;
  int        yljoy;
  int        xrjoy;
  int        yrjoy;
  int       buttons1[8];  
  int       buttons2[8];  

void
setup()
{
    Serial.begin(9600);         // start serial for output

}

void
loop()
{
    char str[30];
    delay(1000);
    psp.getButtons(buttons1, buttons2);
    xljoy = byte(psp.getXLJoy());
    yljoy = byte(psp.getYLJoy()); 
    xrjoy = byte(psp.getXRJoy()); 
    yrjoy = byte(psp.getYRJoy());
    
    Serial.println ("         X       Y ");
    sprintf (str, "Left:    %d    %d", xljoy, yljoy);
    Serial.println (str);
    sprintf (str, "Right:   %d    %d", xrjoy, yrjoy);
    Serial.println (str);

    sprintf (str, "1:  %d %d        %d %d", buttons2[Button_L2], buttons2[Button_L1],
                                         buttons2[Button_R2], buttons2[Button_R1]);
    Serial.println (str);
    sprintf (str, "2:   %d          %d", buttons2[Button_Up], buttons2[Button_Triangle]);
    Serial.println (str);

    sprintf (str, "3:  %d %d        %d %d", buttons1[Button_Left],
                                          buttons1[Button_Right],
                                          buttons2[Button_Square],
                                          buttons2[Button_Circle]);
    Serial.println (str);
    sprintf (str, "4:   %d          %d", buttons1[Button_Down],
                                          buttons2[Button_Cross]);    
    Serial.println (str);
    Serial.println("-----------------------");   
}
