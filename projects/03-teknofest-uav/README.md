# TEKNOFEST UAV Work — AF-1 and Visual Mission Experiments

This track records the user's previously described UAV work associated with TEKNOFEST and related target-detection research. The original competition report, flight logs, CAD, and project-specific code were **not uploaded with this bundle**, so the scope below is an evidence-limited project summary, not a claim of flight-test certification or competition placement.

## Track A — AF-1 fixed-wing UAV development

Previously described work includes **PX4 + Gazebo software-in-the-loop**, **QGroundControl mission management**, an **AF-1 takeoff mission test**, and **camera-based fire/smoke detection from video**. These correspond to simulation/integration and computer-vision experiments; no quantitative flight-control performance data were provided here.

### Engineering focus

- Autopilot simulation and mission workflow (PX4 SITL, Gazebo, QGroundControl).
- Takeoff/mission state management, ground-station observation and telemetry analysis.
- Vision-based interpretation of fire/smoke imagery as a surveillance use case.
- Hardware/software integration planning and validation workflow.

## Track B — Geometry-based visual mission R&D

Related TEKNOFEST mission preparation includes experiments with **red triangular and blue hexagonal visual targets**, YOLO/OpenCV detection and potential camera-to-ground coordinate estimation. References to image-based visual servoing (IBVS), ray–ground intersection and edge deployment were part of design discussions. Do not interpret design intent as completed flight-control performance without logs.

The training/inference assets for these vision models belong to the separate **YOLO Mine & Shape Detection** repository and should be linked here rather than duplicated.

## Distinguish competition categories

TEKNOFEST underwater-system awards or placements (if discussed in other CV material) are separate from UAV competitions. **This UAV portfolio does not claim that an underwater-systems award was won by the AF-1 UAV.**

## Evidence needed

- Original AF-1 PX4/Gazebo launch/configuration files.
- QGroundControl plan files, screenshots, flight or SITL logs.
- Fire/smoke inference example, code and dataset provenance.
- Visual-target source code and validated image sequence/video.
- Competition entry/result document if a placement is to be stated.

[See evidence and upload checklist](docs/evidence-and-next-steps.md).
