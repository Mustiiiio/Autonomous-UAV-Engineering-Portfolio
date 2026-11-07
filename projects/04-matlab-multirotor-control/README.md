# MATLAB Multirotor Control Design

This section organizes earlier discussed **quadcopter dynamics, attitude/position control and MATLAB/Simulink model-design concepts**. The original research simulation projects were not supplied in this conversation. A separate *newly written reference demo* is included to demonstrate the intended control architecture; it must not be cited as the author's original experimental implementation.

## Control architecture

`Trajectory / position reference → position PD/PID → desired linear acceleration → attitude/thrust conversion → attitude PD/PID or LQR → control allocation → ESC/motor inputs → nonlinear 6-DOF plant → estimated states`

A practical real-time implementation requires estimation (IMU/GNSS/barometer/EKF), sensor delays, actuator limits and correct coordinate conventions.

## Dynamics model

For an inertial frame with upward-positive z:

\[
 m\ddot{\mathbf p}=T R(\phi,	heta,\psi)\mathbf e_3-mg\mathbf e_3-\mathbf D(\dot{\mathbf p}),
\quad J\dot{oldsymbol\omega}=oldsymbol	au-oldsymbol\omega	imes(Joldsymbol\omega).
\]

The attached MATLAB reference demo uses a simplified Newton–Euler point-mass/rigid-body model with illustrative inertia, damping and controller gains. It omits rotor aerodynamics, motor first-order dynamics, noisy measurements and saturation-aware control allocation.

## Repository content

- [Mathematical and control design](docs/control-architecture.md)
- [Validation plan](docs/validation-plan.md)
- [`matlab/reference_example/quadrotor_hover_position_demo.m`](matlab/reference_example/quadrotor_hover_position_demo.m) — NEW illustrative MATLAB code; never presented as original experiment

## Reproducibility

In MATLAB, run `quadrotor_hover_position_demo` from its directory. The script plots position tracking, attitude and thrust commands. It has not been executed in MATLAB/Simulink in this packaging environment and should be validated before claiming numeric performance.
