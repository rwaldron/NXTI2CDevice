
// LineLeader.h
//
// This is a class for reading from DIST-Nx, made by Mindsensors.
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=73
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=72
// See http://www.mindsensors.com/index.php?module=pagemaster&PAGE_user_op=view_page&PAGE_id=69

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


#ifndef LineLeader_H
#define LineLeader_H

#define LineLeader_Raw_Calibrated		0x49
#define LineLeader_Raw_Uncalibrated		0x74
#define LineLeader_White_Limit			0x51
#define LineLeader_Black_Limit			0x59
#define LineLeader_White_Calibration	0x64
#define LineLeader_Black_Calibration	0x6C


#define LineLeader_Command			    0x41
#define LineLeader_Steering  			0x42
#define LineLeader_Average			    0x43
#define LineLeader_Result				0x44
#define LineLeader_SetPoint			    0x45
#define LineLeader_Kp				    0x46
#define LineLeader_Ki				    0x47
#define LineLeader_Kd				    0x48
#define LineLeader_Kp_Factor		    0x61
#define LineLeader_Ki_Factor		    0x62
#define LineLeader_Kd_Factor		    0x63

#include "NXTI2CDevice.h"

class LineLeader : public NXTI2CDevice
{
public:
	LineLeader(uint8_t i2c_address = 0x02);

	uint8_t issueCommand(char command);
	bool             calibrateWhite();
	bool             calibrateBlack();
	bool             sleep();
	bool             wakeUp();
	bool             invertLineColorToWhite();
	bool             resetColorInversion();
	bool             takeSnapshot();
	bool             configureUS();
	bool             configureEurope();
	bool             configureUniversal();
	uint8_t          getSetPoint(uint8_t spoint);
	bool	         setSetPoint(uint8_t spoint);
	uint8_t          getKp(uint8_t kp);
	bool	         setKp(uint8_t kp);
	uint8_t          getKi(uint8_t ki);
	bool             setKi(uint8_t ki);
	uint8_t          getKd(uint8_t kd);
	bool             setKd(uint8_t kd);
	uint8_t          getKpFactor(uint8_t kpfact);
	bool             setKpFactor(uint8_t kpfact);
	uint8_t          getKiFactor(uint8_t kifact);
	bool             setKiFactor(uint8_t kifact);
	uint8_t          getKdFactor(uint8_t kdfact);
	bool             setKdFactor(uint8_t kdfact);
	int              getSteering();
	unsigned char    getAverage();	
  unsigned char    getResult();
	uint8_t*         getRawCalibrated();
	uint8_t*         getRawUncalibrated();
	uint8_t*         getWhiteLimit();
	uint8_t*         getBlackLimit();
	uint8_t*         getWhiteCalibration();
	uint8_t*         getBlackCalibration();

};

#endif /* LineLeader_H_ */
