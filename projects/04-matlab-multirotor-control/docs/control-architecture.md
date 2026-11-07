# Multirotor Dynamics and Control Strategy

## State and control variables

A conventional nonlinear multirotor state is `x = [p; v; Euler angles; body angular rates]` with 12 states. Inputs at the rigid-body model level are collective thrust `T` and body torques `τx, τy, τz`. Rotor angular speeds are produced downstream by control allocation and ESC/motor dynamics.

## Outer-loop position controller

The outer loop tracks position and velocity and produces desired inertial acceleration. Translational command conversion maps that acceleration to a feasible collective thrust and reference roll/pitch, subject to attitude and thrust constraints.

## Inner-loop attitude controller

A faster inner loop tracks desired attitude and yaw. For small angles, PD control can provide an initial baseline; hover-linearized LQR gives another model-based controller. PID/LQR performance should be evaluated on the nonlinear plant, not solely on its linearization.

## Models and experimental requirements

- Nonlinear Newton–Euler mechanics and rotation matrices.
- Hover trim and Jacobian linearization where LQR is used.
- Motor/ESC lag, thrust and torque coefficients, mixer layout, saturations.
- State estimation, sampling, noise, external disturbances and delays.
- Simulation comparisons using identical reference commands, initial conditions and metrics.

**Source status:** the architecture is consistent with previously discussed multirotor-control work, but no original MATLAB/Simulink model file was provided. The example under `matlab/reference_example/` is new educational scaffolding.
