
// PSPNx.cpp
//
// This is a class for reading from PSP-Nx, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=61

// Initial version: 2010-06-15 by Andrew Sylvester
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


#include "PSPNx.h"


PSPNx::PSPNx(uint8_t i2c_address)
: NXTI2CDevice(i2c_address)
{
}

uint8_t PSPNx::issueCommand(char command)
{
	return writeByte(PSPNx_Command, (uint8_t)command);
}

bool PSPNx::energize()
{
	return issueCommand('R');
}

bool PSPNx::deEnergize()
{
	return issueCommand('S');
}

bool PSPNx::setDigitalMode()
{
	return issueCommand('A');
}

bool PSPNx::setAnalogMode()
{
	return issueCommand('s');
}

bool PSPNx::setApdaOn()
{
	return issueCommand('N');
}

bool PSPNx::setApdaOff()
{
	return issueCommand('O');
}

int PSPNx::getXLJoy()
{
	return readInteger(PSPNx_XLeftJoystick);
}

int PSPNx::getYLJoy()
{
	return readInteger(PSPNx_YLeftJoystick);
}
int PSPNx::getXRJoy()
{
	return readInteger(PSPNx_XRightJoystick);
}
int PSPNx::getYRJoy()
{
	return readInteger(PSPNx_YRightJoystick);
}

void PSPNx::getButtons(int *buttons1, int *buttons2)
{
	int buf1, buf2;
	buf1 = readByte(PSPNx_ButtonSet1);
	buf2 = readByte(PSPNx_ButtonSet2);
	for (int i = 0; i < 8; i++) {
		buttons1[i]   =  buf1 >> i & 0x01;
    buttons2[i]   =  buf2 >> i & 0x01;
	}
}
