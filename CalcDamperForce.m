function [F_Damper] = CalcDamperForce(v)
%CALCDAMPERFORCE Summary of this function goes here
%   Detailed explanation goes here
alpha = 20; %[N*s/m]
f_const = 10; %[N]


F_Damper = v * alpha + f_const * sign(v);

% if (v > 0.0)
%     F_Damper = f_const + v * alpha;
% elseif (v < 0.0)
%     F_Damper = -f_const + v * alpha;
% else
%     F_Damper = 0.0;
% end
end

