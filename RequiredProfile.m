function [x, v] = RequiredProfile(t)
%REQU Summary of this function goes here
%   Detailed explanation goes here
x00 = 0;
x01 = 0.5;
x02 = 1;
x03 = x01;

for i = 1: length(t)
   if(t(i) >=0 && t(i) <= 1)
       v(i) = t(i);
       x(i) = t(i)^2 / 2 + x00;
   elseif(t(i) >=1 && t(i) <= 2)
       v(i) = -t(i) + 2;
       x(i) = -(t(i)-1)^2 / 2 + (t(i)-1)  + x01;
   elseif(t(i) >=2 && t(i) <= 3)
       v(i) = -t(i) + 2;
       x(i) = -(t(i)-2)^2 / 2  + x02;
   elseif(t(i) >=3 && t(i) <= 4)
       v(i) = t(i) - 4;
       x(i) = (t(i)-3)^2 / 2 - (t(i) -3) + x03;
   end
end

v = [v -v(2:end)];
x = [x -x(2:end)];

% figure;
% plot(t,v,'b', 'linewidth', 1.5)
% hold on
% plot(t,x, 'r', 'linewidth', 1.5)
% grid
% legend('V_{req} [m/s]', 'X_{req} [m]', 'Location', 'southwest')
% xlabel('Time [sec]'); ylabel('V_{req}, X_{req}');
end

