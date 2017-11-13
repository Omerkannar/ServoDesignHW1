function [Length, theta] = CalcRodLength(x)
%CALCRODLENGTH Summary of this function goes here
%   Detailed explanation goes here
NominalLength = 1.5; %[m]
Length = sqrt(NominalLength^2 + x.^2);
theta = asin(x / NominalLength);
end

