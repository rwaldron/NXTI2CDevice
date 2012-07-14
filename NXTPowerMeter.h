
// NXTPowerMeter.h
//
// This is a class for reading from NXT Power Meter, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=125

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


#ifndef NXTPowerMeter_H
#define NXTPowerMeter_H

#define NXTPowerMeter_Command				0x41
#define NXTPowerMeter_Present_Current		0x42
#define NXTPowerMeter_Present_Voltage	 	0X44
#define NXTPowerMeter_Capacity_Used			0X46
#define NXTPowerMeter_Elapsed_Time			0x56

#include "NXTI2CDevice.h"

class NXTPowerMeter : public NXTI2CDevice
{
public:
	NXTPowerMeter(uint8_t i2c_address = 0x12);
	
	uint8_t		issueCommand(char command);
	bool		resetCounters();
	int			readPresentCurrent();
	int			readPresentVoltage();
	int			readCapacityUsed();
	long		readElapsedTime();

};

#endif
