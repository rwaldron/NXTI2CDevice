
// NXTHID.h
//
// This is a class for controlling the NXT Human Interface Device, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=119.

// Initial version: 2010-06-17 by Andrew Sylvester
// Large parts of the code is ported from the NXC library for the device,
// written by Deepak Patil.

/*
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
*/


#ifndef NXTHID_H
#define NXTHID_H

#define HID_Command		 0x41
#define HID_Modifier     0x42
#define HID_Text         0x04
#define HID_Keyboard     0x43

#define HID_None       0x00
#define HID_L_Ctrl     0x01
#define HID_L_Shift    0x02
#define HID_L_Alt      0x04
#define HID_L_GUI      0x08
#define HID_R_Ctrl     0x10
#define HID_R_Shift    0x20
#define HID_R_Alt      0x40
#define HID_R_GUI      0x80

#include "NXTI2CDevice.h"

class NXTHID : public NXTI2CDevice
{
public:
	NXTHID(uint8_t i2c_address = 0x04);

	uint8_t		issueCommand(char command);
	bool		transmitData();
	bool		asciiMode();
	bool		directMode();
	bool		setModifier(uint8_t mod);
	bool		sendKeyboardData(uint8_t data);
	bool		sendTextString(char *str);

};

#endif
