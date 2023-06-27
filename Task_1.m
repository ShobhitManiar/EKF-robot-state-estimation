clear all;
close all;

inputs=load('my_input.mat');
M=load('my_measurements.mat');
T=inputs.t';
dt=T(2)-T(1);
%x=A*x(k+1)+B*u
A=eye(3); %transition matrix being a identity 
x = zeros(3,length(T));
x(:,1)=[1;1;0]; %initialize x
SNR=0.1; %signal to noise ratio
Q=  SNR*diag([0.01,0.25]); %process noise
sigma_r1=0.01;
sigma_r2=0.09;
sigma_b=0.25;
R_fused = diag([sigma_r1,sigma_b,sigma_r1,sigma_b,sigma_r1,sigma_b,sigma_r2,sigma_b,sigma_r2,sigma_b,sigma_r2,sigma_b]); % Measurement noise covariance matrix
P=zeros(3,3,length(T)); %State Covariance matrix
P(:,:,1) = diag([1, 1, 1]) * 10^-5; %initialized P
l=M.l;

%measurement model matrix
h_nl = @(x) [];
for i = 1:size(l, 1)
    h_nl = @(x) [h_nl(x);
                 sqrt((l(i,1)-x(1)).^2+(l(i,2)-x(2)).^2);
                 wrapToPi(atan2(l(i,2)-x(2),l(i,1)-x(1)))-x(3)]; % Append distance and angle calculations to h_nl
end


%% EKF Filter algorithm-----------------------------------------------------

for i = 1:length(T)-1
  % Measurements initialisation
z =[M.r(i,1);M.b(i,1);M.r(i,2);M.b(i,2);M.r(i,3);M.b(i,3);M.r(i,4);M.b(i,4);M.r(i,5);M.b(i,5);M.r(i,6);M.b(i,6)];
ChiStat = zeros(1,length(T));
G=gama(x(:,i),dt);
F=B_matrix(x(:,i),dt,inputs.v(1,i));
% Equation 1: State propagation
xa = x(:,i)+G*[inputs.v(1,i)+0.01; inputs.om(1,i)+0.25];
% Equation 2: State covariance propagation
Pa = F*P(:,:,i)*F'+ G*Q*G';
%% Measurement Update======================================== 
za=h_nl(xa);%Predicted measurements using a priori states
% Jacobian matrix: linearization of the measurement model
H=H_mat(xa,M.r(i,:),M.b(i,:),l,0);
dz = z-za;
% Equation 3: Innovation
S = H*Pa*H'+R_fused;
Yzz = S^(-1);  %Information matrix of innovations
% Equation 5: Kalman gain
K = Pa*H'*Yzz; 
% Equation 6: State update
x(:,i+1) = xa + K*dz;
% Equation 7: Error covariance update
P(:,:,i+1) = (eye(3) - (K * H ))* Pa;
% Compute Chi-squared statistics:
ChiStat(i+1) = dz'*Yzz*dz;
%% POST-PROCESSING
z_post = h_nl(xa);
end


Task_1_unfused_1_3(1);%singal landmark
Task_1_unfused_1_3(2);%singal landmark
Task_1_unfused_1_3(3);%singal landmark
Task_1_unfused_4_6(4);%singal landmark
Task_1_unfused_4_6(5);%singal landmark
Task_1_unfused_4_6(6);%singal landmark

figure(1)
plot(x(1,:),x(2,:),'b','LineWidth', 3);
hold on
figure(1)
scatter(l(:,1),l(:,2),'r');
hold on
axis auto
legend('Landmark 1','Landmark 2','Landmark 3','Landmark 4','Landmark 5','Landmark 6','Fusion', 'Location','southeast');
