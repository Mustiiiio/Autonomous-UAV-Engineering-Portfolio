# MATLAB/Simulink Model Validation Checklist

1. Confirm frame conventions, angle units, motor numbering, physical parameters and sign conventions.
2. Check nonlinear equations against hover equilibrium: `T = mg`, rates zero, acceleration zero.
3. Validate rotation matrix orthogonality and energy/force balance.
4. Run hover, step-position and yaw-change tests separately.
5. Compare PID and LQR from the *same* initial state on the *same* nonlinear plant.
6. Log RMS position/attitude error, rise/settling times, overshoot, torque/thrust saturation, and control energy.
7. Inject reasonable wind, mass error, sensor noise, motor lag and sample-rate changes.
8. Export time histories, model parameter table, MATLAB/Simulink version and reproducible configuration.

**Do not publish invented benchmark numbers.** This directory currently contains a model-design description and a new reference example, not a verified controller-comparison dataset.
