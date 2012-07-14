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
 */

/*****************************************************************************************

For a full list of direct control commands download the NXT HID User Guide at
http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=119

*****************************************************************************************/

#include <Wire.h>               // Needs to be included here for //
                                // the NXTI2CDevice to work      //
#include <NXTI2CDevice.h>
#include <NXTHID.h>

NXTHID          hid;

void
setup()
{
  Serial.begin(9600);         // start serial for output
  delay(1000);  
//Display "Hello World!!!"
  hid.setModifier(HID_L_Shift);  ///HID_None, L_Ctrl, L_Shift, L_Alt, L_GUI, R_Ctrl, R_Shift, R_Alt, or R_GUI
  hid.directMode(); 
  hid.sendKeyboardData(0x0B);
  hid.setModifier(HID_None); 
  hid.sendKeyboardData(0x08);  
  hid.sendKeyboardData(0x0F);
  hid.sendKeyboardData(0x0F);
  hid.sendKeyboardData(0x12);
  hid.sendKeyboardData(0x2C);
  hid.setModifier(HID_L_Shift);
  hid.sendKeyboardData(0x1A);
  hid.setModifier(HID_None); 
  hid.sendKeyboardData(0x12);
  hid.sendKeyboardData(0x15);
  hid.sendKeyboardData(0x0F);
  hid.sendKeyboardData(0x07);
  hid.setModifier(HID_L_Shift);
  hid.sendKeyboardData(0x1E);
  hid.sendKeyboardData(0x28);

  hid.sendTextString("Hello!\rHello Again!!\r");

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

