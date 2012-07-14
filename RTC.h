
// RTC.h
// This is a class for reading from Real-time Clock, made by Mindsensors.
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


#ifndef RTC_H
#define RTC_H

#define RTC_Seconds			0x00
#define RTC_Minutes			0x01
#define RTC_Hours			0x02
#define RTC_Day_of_Week		0x03
#define RTC_Day_of_Month	0x04
#define RTC_Month			0x05
#define RTC_Year			0x06

#include "NXTI2CDevice.h"

class RTC : public NXTI2CDevice
{
public:
	RTC(uint8_t i2c_address = 0xD0);
	
	uint8_t getSeconds();
	uint8_t getMinutes();
	uint8_t getHours();
	uint8_t getDayWeek();
	uint8_t getDayMonth();
	uint8_t getMonth();
	uint8_t getYear();

private:
  uint8_t BCDToInteger(uint8_t b);

};

#endif /* RTC_H_ */
