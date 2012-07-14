
// ACCLNx.h
//
// This is a class for reading from ACCL-Nx, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=101

// Initial version: 2010-06-10 by Andrew Sylvester
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


#ifndef ACCLNx_H
#define ACCLNx_H

#define ACCLNx_Command      0x41
#define READ_SENS			0x19

#define ACCLNx_X_TILT		0x42
#define ACCLNx_Y_TILT		0x43
#define ACCLNx_Z_TILT		0x44
#define ACCLNx_X_ACCL		0X45
#define ACCLNx_Y_ACCL		0X47
#define ACCLNx_Z_ACCL		0X49

#include "NXTI2CDevice.h"

class ACCLNx : public NXTI2CDevice
{
public:
	ACCLNx(uint8_t i2c_address = 0x02);
	
	uint8_t		issueCommand(char command);
	bool		aquireXpointCalibration();
	bool		aquireXpointCalibrationEnd();
	bool		aquireYpointCalibration();
	bool		aquireYpointCalibrationEnd();
	bool		aquireZpointCalibration();
	bool		aquireZpointCalibrationEnd();
	bool		resetFactory();
	bool		setApdaOn();
	bool		setApdaOff();
	short		getXTilt();
	short		getYTilt();
	short		getZTilt();
	int			getXAccl();
	int			getYAccl();
	int			getZAccl();
	short		getSens();

};

#endif