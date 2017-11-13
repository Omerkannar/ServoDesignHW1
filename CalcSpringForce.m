function [F_spring] = CalcSpringForce(x)
%CALCSPRINGFORCE Summary of this function goes here
%   Detailed explanation goes here
k = 50; %[N/m]

F_spring = -k * x;
end

