
// PFMate.h
//
// This is a class for controlling the PF Motor Controller, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=107 .

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


#ifndef PFMate_H
#define PFMate_H

#define PF_Commmand               0x41

#define PF_Channel                0x42
#define PF_Channel_1              1
#define PF_Channel_2              2
#define PF_Channel_3              3
#define PF_Channel_4              4

#define PF_Control                0x43
#define PF_Contol_Both            0   
#define PF_Contol_A               1
#define PF_Contol_B               2

#define PF_Speed_A                0x45
#define PF_Speed_B                0x47
#define PF_Speed_Slow             1
#define PF_Speed_Medium           4
#define PF_Speed_Full             7

#define PF_Operation_A            0x44
#define PF_Operation_B            0x46
#define PF_Operation_Float        0
#define PF_Operation_Forward      1
#define PF_Operation_Reverse      2
#define PF_Operation_Brake        3

#include "NXTI2CDevice.h"

class PFMate : public NXTI2CDevice
{
public:
	PFMate(uint8_t i2c_address = 0x48);

	uint8_t		issueCommand(char command);
	bool		sendSignal();
    void		controlMotor(uint8_t channel, uint8_t contol, uint8_t operation, uint8_t speed);
	bool		setChannel(uint8_t channel);
    bool		setControl(uint8_t contol);
	bool		setOperationA(uint8_t operation);
	bool		setOperationB(uint8_t operation);
	bool		setSpeedA(uint8_t speed);
	bool		setSpeedB(uint8_t speed);
};

#endif
