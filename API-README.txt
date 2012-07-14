I2C device API's

NXTServo:
~getBatteryVoltage()
     -Retrieves the battery voltage 
~storeInitial() 
     -Store the initial speed and position properties of a servo
~reset() 
     -Reset servo properties to factory default
~halfMacro() 
     -Re-initializes the macro enviornment
~resumeMacro() 
     -Resumes macro when it was paused in the same enviornment 
~gotoEEPROM() 
     -Re-initializes the macro enviornment
~editMacro() 
     -Edit macro
~pauseMacro() 
     -Pauses the macro, and saves for subsequent resumption
~setSpeed(uint8_t number, uint8_t speed) 
     -Set speed of servo 
	*number:Servo_1, 2, ..., 8 
	*speed [0, inf] or Servo_Speed_Full
~setPosition(uint8_t number, uint8_t position)
     -Set position of servo 
	*number:Servo_1, 2, ..., 8 
	*position [500, 2500] or Servo_Position_Default
~runServo(uint8_t number, uint8_t position, uint8_t speed)
     -Run a Servo to a certain position at a certain speed
	*number:Servo_1, 2, ..., 8 
	*speed [500, 2500] or Servo_Position_Default
	*position [500, 2500] or Servo_Position_Default


PFMate:
~issueCommand(char command)
~sendSignal()
~controlMotor(uint8_t channel, uint8_t contol, uint8_t operation, uint8_t speed)
   -Control the PF Motors
	*channel : PF_Channel_1, 2, 3, or 4
	*control : PF_Contol_Both, A, or B
	*operation : PF_Operation_Forward, Reverse, Float, or Brake
	*speed :  [1, 7] or PF_Speed_Full, Medium, or Slow
~setChannel(uint8_t channel)
~setControl(uint8_t contol)
~setOperationA(uint8_t operation)
~setOperationB(uint8_t operation)
~setSpeedA(uint8_t speed)
~setSpeedB(uint8_t speed)


NXTHID:
~transmitData()
     -Transmit data to hsot computer
~asciiMode()
     -Setup device for ascii data mode
~directMode()
     -Setup device for direct data mode   
~setModifier(uint8_t mod)
    -Setup the key modifier
	*HID_None, L_Ctrl, L_Shift ,  L_Alt, L_GUI, R_Ctrl, R_Shift, R_Alt, R_GUI,
~sendKeyboardData(uint8_t data)
    -Send specific key data


NXTMMX:
~getBatteryVoltage()
~issueCommand(char command)
~setEncoderTarget(uint8_t which_motor, long target)
~getEncoderTarget(uint8_t which_motor)
setSpeed(uint8_t which_motor, int speed)
~getSpeed(uint8_t which_motor)
~getTimeToRun(uint8_t which_motor, int seconds)
~getTimeToRun(uint8_t which_motor)
~setCommandRegB(uint8_t which_motor, uint8_t value)
~getCommandRegB(uint8_t which_motor)
~setCommandRegA(uint8_t which_motor, uint8_t value)
~getCommandRegA(uint8_t which_motor)
~getEncoderPosition(uint8_t which_motor)
~getMotorStatusByte(uint8_t which_motor)
~getMotorTasksRunningByte(uint8_t which_motor)
~setEncoderPID(uint16_t Kp, uint16_t Ki, uint16_t Kd)
~setSpeedPID(uint16_t Kp, uint16_t Ki, uint16_t Kd)
~setPassCount(uint8_t pass_count)
~setTolerance(uint8_t tolerance)
~reset()
~startMotorsInSync()
~resetEncoder(uint8_t which_motor)
~setSpeedTimeAndControl(uint8_t which_motors, int speed, uint8_t duration, uint8_t control)
setEncoderSpeedTimeAndControl(uint8_t  which_motors, long encoder, int speed, uint8_t duration, uint8_t control)
~isTimeDone(uint8_t which_motors)
~waitUntilTimeDone(uint8_t  which_motors)
~isTachoDone(uint8_t  which_motors)
~waitUntilTachoDone(uint8_t  which_motors)
~runUnlimited(uint8_t which_motors, uint8_t direction, int speed)
~runSeconds(uint8_t  which_motors, uint8_t direction, int speed, uint8_t duration, uint8_t wait_for_completion, uint8_t next_action)
~runTachometer(uint8_t which_motors, uint8_t direction, int speed, long tachometer, uint8_t relative, uint8_t wait_for_completion, uint8_t next_action)
~runDegrees(uint8_t which_motors, uint8_t direction,int speed, long degrees, uint8_t wait_for_completion, uint8_t  next_action)
~void runRotations(uint8_t  which_motors, uint8_t direction, int speed, long rotations, uint8_t wait_for_completion, uint8_t next_action)~stop(uint8_t which_motors, uint8_t next_action)

ACCLNx:
~issueCommand(char command)
~aquireXpointCalibration()
~aquireXpointCalibrationEnd()
~aquireYpointCalibration()
~aquireYpointCalibrationEnd()
~aquireZpointCalibration()
~aquireZpointCalibrationEnd()
~resetFactory()
~setApdaOn()
~setApdaOff()
~getXTilt()
~getYTilt()
~getZTilt()
~getXAccl()
~getYAccl()
~getZAccl()
~getSens()

DISTNx:
~issueCommand(char command)
~setModuleGP2D12()
~setModuleGP2D120()
~setModuleGP2Y0A21YK()
~setModuleGP2Y0A02YK()
~setModuleCustom()
~energized()
~deenergized()
~setApdaOn()
~setApdaOff()
~getDist()
~getVolt()
~getType()

PSPNx:	
~issueCommand(char command)
~energized()
~deenergized()
~setDigitalMode()
~setAnalogMode()
~setApdaOn()
~setApdaOff()
~getXLJoy()
~getYLJoy()
~getXRJoy()
~getYRJoy()
~getButtons(int *buttons1, int *buttons2);

LineLeader:
~issueCommand(char command)
~calibrateWhite()
~calibrateBlack()
~sleep()
~wakeUp()
~invertLineColorToWhite()
~resetColorInversion()
~takeSnapshot()
~configureUS()
~configureEurope()
~configureUniversal()
~getSetPoint()
~setSetPoint(uint8_t spoint)
~getKp()
~setKp(uint8_t kp)
~getKi()
~setKi(uint8_t ki);
~getKd()
~setKd(uint8_t kd)
~getKpFactor()
~setKpFactor(uint8_t kpfact)
~getKiFactor()
~setKiFactor(uint8_t kifact)
~getKdFactor()
~setKdFactor(uint8_t kdfact)
~getSteering()
~getAverage()
~getResult()
~getRawCalibrated()
~getRawUncalibrated()
~getWhiteLimit()
~getBlackLimit()
~getWhiteCalibration()
~getBlackCalibration()

NXTPowerMeter:
~issueCommand(char command)
~resetCounters()
~readPresentCurrent()
~readPresentVoltage()
~readCapacityUsed()
~readElapsedTime()

RTC:
~getSeconds()
~getMinutes()
~getHours()
~getDayWeek()
~getDayMonth()
~getMonth()
~getYear()

NXTCam:
~issueCommand(char command)
~sortSize()
~selectObjectMode()
~writeImageRegisters()
~disableTracking()
~enableTracking()
~getColorMap()
~illuminationOn()
~readImageRegisters()
~selectLineMode()
~adpaOn()
~adpaOff()
~pingCam()
~resetCam()
~sendColorMap()
~illuminationOff()
~sortColor()
~sortNone()
~camFirmware()
~getNumberObjects()
~getBlobs(int *nblobs, uint8_t *color, uint8_t *left, uint8_t *top, uint8_t *right, uint8_t *bottom)
