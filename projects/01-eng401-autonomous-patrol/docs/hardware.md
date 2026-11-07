# ENG401 Hardware Integration Notes

The goal was not to design a production-ready flight controller but to integrate a functional quadcopter bench platform with an existing ArduCopter autopilot.

## Architecture

`4S LiPo → power module / distribution → 4-in-1 ESC → four BLDC motors` 

`Power module → regulated avionics rail → Pixhawk 2.4.8`

`Pixhawk MAIN OUT → ESC signal harness`

`M8N GNSS/compass → Pixhawk GPS/compass interfaces`

`Wi-Fi MAVLink → Pixhawk TELEM ↔ Mission Planner`

`Pixhawk AUX OUT → SG90 servo (separately powered from a suitable regulated rail)`

## Bench verification documented

1. Inspect solder joints, polarity, and mechanical cable strain relief.
2. Check for unwanted continuity between battery supply and ground.
3. Complete Pixhawk sensor recognition/orientation calibration in Mission Planner.
4. Conduct motor mapping test with propellers removed.
5. Verify motor direction, ESC interface, and servo PWM command behavior.
6. Demonstrate mission-level `DO_SET_SERVO` configuration.

## Caveats

- The source lists DShot300 as an example protocol; actual firmware/output compatibility depends on the installed hardware and configuration, and should be verified against log files.
- The presence of a wiring diagram does not independently validate all physical pin assignments.
- The flight-controller PCB in EasyEDA is a schematic/layout concept, not a manufactured board.
