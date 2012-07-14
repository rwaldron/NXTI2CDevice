
// NXTCam.h
//
// This is a class for controlling the NXT Cam, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=78 .

// Initial version: 2010-06-18 by Andrew Sylvester
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


#ifndef NXTCam_H
#define NXTCam_H

#define Cam_Command						   0x41
#define Cam_Number_Objects				   0x42
#define Start_Reg						   0x43

#include "NXTI2CDevice.h"

class NXTCam : public NXTI2CDevice
{
public:
	NXTCam(uint8_t i2c_address = 0x02);
	
	uint8_t		issueCommand(char command);
	bool		sortSize();
	bool		selectObjectMode();
	bool		writeImageRegisters();
	bool		disableTracking();
	bool		enableTracking();
	bool		getColorMap();
	bool		illuminationOn();
	bool		readImageRegisters();
	bool		selectLineMode();
	bool		adpaOn();
	bool		adpaOff();
	bool		pingCam();
	bool		resetCam();
	bool		sendColorMap();
	bool		illuminationOff();
	bool		sortColor();
	bool		sortNone();
	bool		camFirmware();
	int			getNumberObjects();
	void		getBlobs(int *nblobs, uint8_t *color, uint8_t *left, uint8_t *top, uint8_t *right, uint8_t *bottom);

};

#endif