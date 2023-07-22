# Fergminster Clock
A shell script I wrote while *very* drunk that implements a Westminster chiming clock except it uses Fergalicious instead of the Westminster chimes.

Like a Westminster chiming clock, at the top of the hour, it will chime once for each hour before completing the "chime" with the rest of the verse.  Unlike the config options, the chimes are in 12-hour format, so the most you will hear is 12 chimes.  Additionally, like the clock your grandma probably had, it will do a short chime every 15 minutes.

## Requirements
Audio hardware and availability of `aplay` to play the sounds

## Configuring
Configuration is performed by editing the variables in the script.

#### Quiet Hours
Quiet hours are the start and end times where the chimes should be suppressed.  The hours are defined in 24-hour format.

`QUIET_HOUR_BEGIN` is the hour where the chimes should no longer be played. This is inclusive, so if set to 20, the last chime you will hear will be at 19:45

`QUIET_HOUR_END` is the hour where the chimes should resume playing. This is also inclusive, so if set to 7, the first chime of the day will be at 07:00.

#### Using another player besides aplay
If you do not or cannot use aplay, you can set another executable to be used by editing the value for `PLAY_CMD`.  This must include any flags or options and must expect the last attribute to be the file that is to be played.  e.g. `$PLAY_CMD /path-to-file.wav`


## Example
```
3:15 PM:  Fergalicious def...

3:30 PM:  Fergalicious def...

3:45 PM:  Fergalicious def...

4:00 PM:  Fergalicious def...
	Fergalicious def...
	Fergalicious def...
	Fergalicious def...
	...def def def def def 
	Fergalicious definition, make the boys go crazy
	...
	And can't no other lady put it down like me.
```
