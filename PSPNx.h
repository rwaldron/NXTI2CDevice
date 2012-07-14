
// PSPNx.h
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


#ifndef PSPNx_H
#define PSPNx_H

#define PSPNx_Command          0x41
#define PSPNx_ButtonSet1       0x42
#define PSPNx_ButtonSet2       0x43
#define PSPNx_XLeftJoystick    0x44
#define PSPNx_YLeftJoystick    0x45
#define PSPNx_XRightJoystick   0x46
#define PSPNx_YRightJoystick   0x47

#define Button_L2        0
#define Button_R2        1
#define Button_L1        2
#define Button_R1        3
#define Button_Triangle  4
#define Button_Circle    5
#define Button_Cross     6
#define Button_Square    7

#define Button_Start     3
#define Button_L3        1
#define Button_R3        2
#define Button_Select    0
#define Button_Up        4
#define Button_Right     5
#define Button_Down      6
#define Button_Left      7

#include "NXTI2CDevice.h"

class PSPNx : public NXTI2CDevice
{
public:
  PSPNx(uint8_t i2c_address = 0x02);

  uint8_t     issueCommand(char command);
  bool        energize();
  bool        deEnergize();
  bool        setDigitalMode();
  bool        setAnalogMode();
  bool        setApdaOn();
  bool        setApdaOff();
  int         getXLJoy();
  int         getYLJoy();
  int         getXRJoy();
  int         getYRJoy();
  void        getButtons(int *buttons1, int *buttons2);

};

#endif
