
// NXTI2CDevice.h
//
// This is a class for controlling some LEGO Mindstorms NXT devices that
// communicate using the I2C protocol.
//
// Use at your own risk!
//
// Initial version: 2010-05-31 by Clinton Blackmore

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

#ifndef BASENXTI2CDEVICE_H
#define BASENXTI2CDEVICE_H

#include "Arduino.h"
#include <inttypes.h>

inline uint16_t readIntFromBuffer(uint8_t* buf)
{
	return buf[0] | (buf[1] << 8);
}

inline uint32_t readLongFromBuffer(uint8_t* buf)
{
	return buf[0] | (buf[1] << 8) | (buf[2] << 16) | (buf[3] << 24);
}

inline void writeByteToBuffer(uint8_t* buf, uint8_t data)
{
	buf[0] = data;
}

inline void writeByteToBuffer(uint8_t* buf, int8_t data)
{
	writeByteToBuffer(buf, (uint8_t)data);
}

inline void writeIntToBuffer(uint8_t* buf, uint16_t data)
{
	buf[0] = data & 0xFF;
	buf[1] = (data >> 8) & 0xFF;
}

inline void writeIntToBuffer(uint8_t* buf, int16_t data)
{
	writeIntToBuffer(buf, (uint16_t)data);
}

inline void writeLongToBuffer(uint8_t* buf, uint32_t data)
{
	buf[0] = data & 0xFF;
	buf[1] = (data >>  8) & 0xFF;
	buf[2] = (data >> 16) & 0xFF;
	buf[3] = (data >> 24) & 0xFF;
}

inline void writeLongToBuffer(uint8_t* buf, int32_t data)
{
	writeLongToBuffer(buf, (uint32_t)data);
}

class NXTI2CDevice
{
	// Note that this class is a base class, but not an abstract base class
	// Feel free to instantiate NXTI2CDevices.

public:

	NXTI2CDevice(uint8_t i2c_address);

	// Routines to read registers from the I2C device
	// Only the first two parameters are required.
	uint8_t* 	readRegisters	(uint8_t start_register, uint8_t bytes_to_read,
								uint8_t* buffer = 0, uint8_t buffer_length = 0, bool clear_buffer = false);

	uint8_t  	readByte	(uint8_t location);
	uint16_t  	readInteger	(uint8_t location);
	uint32_t  	readLong	(uint8_t location);
	char* 		readString	(uint8_t  location, uint8_t  bytes_to_read,
							 uint8_t* buffer = 0, uint8_t  buffer_length = 0);


	// Routines to write data to registers of the I2C device

	bool 		writeRegisters	(uint8_t start_register, uint8_t bytes_to_write,
								uint8_t* buffer = 0);

	bool 		writeByte	(uint8_t location, uint8_t data);
	bool 		writeInteger(uint8_t location, uint16_t data);
	bool 		writeLong	(uint8_t location, uint32_t data);

	bool checkAddress();
	bool setAddress(uint8_t i2c_address);
	uint8_t getAddress();

	uint8_t		getWriteErrorCode();

	// Read some strings from the device.
	// (I believe this is consistent for all NXT I2C devices).
	char*		getFirmwareVersion();
	char*		getVendorID();
	char*		getDeviceID();


protected:

	static uint8_t* _buffer;	// Buffer used for data that is returned from I2C commands

	void		setWriteErrorCode(uint8_t code);

private:

	uint8_t _device_address;	// I2C address of the NXT device
	uint8_t _write_error_code;	// Error code from last write
};

#endif // BASENXTI2CDEVICE_H
