function quadrotor_hover_position_demo
% NEW REFERENCE EXAMPLE (not an original archived research simulation).
% Simplified nonlinear 12-state quadrotor with cascaded position/attitude PD.
% No mixer, motor dynamics, state estimator, disturbance, or hardware model.
% Position z is UP; inertial frame right-handed; rotation Rz*Ry*Rx.

m = 1.2; g = 9.81; J = diag([0.019 0.019 0.034]);
Kp_pos = diag([1.6 1.6 3.0]); Kd_pos = diag([2.2 2.2 3.2]);
Kp_att = diag([0.8 0.8 0.4]); Kd_att = diag([0.28 0.28 0.20]);
Ts = 0.01; tf = 15; t = (0:Ts:tf)'; n = numel(t);
X = zeros(n, 12); U = zeros(n, 4); Ref = zeros(n,3);
X(1,1:3) = [0 0 0];
for k = 1:n-1
    target = [1; 1; 1.2]; Ref(k,:) = target';
    q = X(k,1:3)'; v = X(k,4:6)';
    eul = X(k,7:9)'; omega = X(k,10:12)';
    a_des = Kp_pos*(target-q) - Kd_pos*v;
    a_des(3) = max(min(a_des(3), 6), -6);
    psi_ref = 0;
    phi_ref = (a_des(1)*sin(psi_ref)-a_des(2)*cos(psi_ref))/g;
    theta_ref = (a_des(1)*cos(psi_ref)+a_des(2)*sin(psi_ref))/g;
    phi_ref = max(min(phi_ref,deg2rad(20)),-deg2rad(20));
    theta_ref = max(min(theta_ref,deg2rad(20)),-deg2rad(20));
    den = max(0.55,cos(eul(1))*cos(eul(2)));
    Tcmd = m*(g + a_des(3))/den;
    Tcmd = max(0,min(3*m*g,Tcmd));
    tau = Kp_att*([phi_ref; theta_ref; psi_ref]-eul)-Kd_att*omega;
    tau = max(min(tau,[0.5;0.5;0.3]),-[0.5;0.5;0.3]);
    U(k,:) = [Tcmd tau'] ;
    u = [Tcmd;tau]; xs = X(k,:)';
    f1 = plant(xs,u,m,J,g); f2 = plant(xs+0.5*Ts*f1,u,m,J,g);
    f3 = plant(xs+0.5*Ts*f2,u,m,J,g); f4 = plant(xs+Ts*f3,u,m,J,g);
    X(k+1,:) = (xs+Ts/6*(f1+2*f2+2*f3+f4))';
end
Ref(n,:) = [1 1 1.2]; U(n,:) = U(n-1,:);
figure('Name','Position tracking — new reference demo');
for i=1:3
 subplot(3,1,i); plot(t, X(:,i),'b',t,Ref(:,i),'k--');
 ylabel(sprintf('axis %d (m)', i)); grid on; if i==1; legend('actual','desired'); end
end
xlabel('Time (s)');
figure('Name','Attitude and thrust — new reference demo');
subplot(2,1,1); plot(t,rad2deg(X(:,7:9))); grid on;
ylabel('Euler angles (deg)');legend('roll','pitch','yaw');
subplot(2,1,2); plot(t,U(:,1)); grid on; ylabel('Thrust (N)'); xlabel('Time (s)');
end

function dx=plant(x,u,m,J,g)
p=x(1:3); v=x(4:6); angles=x(7:9); omega=x(10:12);
phi=angles(1); theta=angles(2); psi=angles(3);
cr=cos(phi);sr=sin(phi); ct=cos(theta);st=sin(theta);
cy=cos(psi); sy=sin(psi);
Rx=[1 0 0;0 cr -sr;0 sr cr];
Ry=[ct 0 st;0 1 0;-st 0 ct];
Rz=[cy -sy 0;sy cy 0;0 0 1];
R=Rz*Ry*Rx;
drag=0.10*v;
a=(R*[0;0;u(1)]-drag)/m-[0;0;g];
ct_safe=sign(ct)*max(abs(ct),1e-4);
E=[1 sr*st/ct_safe cr*st/ct_safe; 0 cr -sr; 0 sr/ct_safe cr/ct_safe];
eul_dot=E*omega;
w_dot=J\(u(2:4)-cross(omega,J*omega));
dx=[v; a; eul_dot; w_dot];
end
