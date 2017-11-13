clearvars
close all
clc

%% Desire movement profile

t = linspace(0,8,1001);

[x, v] = RequiredProfile(t);

[L, theta] = CalcRodLength(x);
% theat = zeros(1,length(theta));
F_Spring = CalcSpringForce(x);
F_Damper = CalcDamperForce(v);
Motor.J = [100 800 500 1000]*10^(-7);
Gear.J = [0.05 0.01 0.05 1.000] ;
Gear.N = [30 50 50 100];
Gear.FrictionMoment = [2 3 6 5];
for mm = 1: 4
    for gg = 1 : 4 
        for i = 1: length(t)          
            if ((t(i) <= 1) || (t(i) > 3 && t(i) <= 4) || (t(i) > 5 && t(i) <= 7))
                A(mm,gg,i) = (1 / L(i)) / Gear.N(gg);
            elseif ((t(i) > 1 && t(i) <= 3) || (t(i) > 4 && t(i) <= 5) || (t(i) > 7 && t(i) <= 8))
                A(mm,gg,i) = (-1 / L(i)) / Gear.N(gg);
            end
            
                B(mm,gg,i) = Gear.N(gg)^2 * Motor.J(mm) + Gear.J(gg) + 0.5 * L(i);
                C(mm,gg,i) = Gear.FrictionMoment(gg) + (F_Damper(i) + F_Spring(i)) * L(i) * cos(theta(i));
                TMax(mm,gg,i) = A(mm,gg,i) * B(mm,gg,i) * C(mm,gg,i) * 1e3;
                omega(mm,gg,i) = Gear.N(gg) * (v(i) * cos(theta(i)) / L(i)) * 30.0 / pi();
        end
    end
end
% for mm = 1: 4
%     figure(mm)
%     hold on
%     for gg = 1 : 4 
% %       subplot(2,2,gg)
%         title(['Motor - ' ,num2str(mm)])
%         Tm = zeros(1,length(t));
%         Om = zeros(1,length(t));
%         for i = 1: length(t)
%             Tm(i) = TMax(mm,gg,i);        
%             AngularVel(i) = omega(mm,gg,i);
%         end
%         plot(t,Tm) 
%     end
%     legend('1','2','3','4')
% end
% 
% figure;
% hold on
% grid minor
% for gg = 1 : 4
%     %       subplot(2,2,gg)
%     % title(['Motor - ' ,num2str(mm)])
%     Om = zeros(1,length(t));
%     for i = 1: length(t)
%         AngularVel(i) = omega(1,gg,i);
%     end
%     plot(t,AngularVel, 'linewidth', 2)
% end
% legend('1','2','3','4')

for mm = 1 : 4
    figure(mm + 100)
    for gg = 1: 4
        subplot(2,2,gg)
        jj = 1;
        for i = 1 : length(t)
            if(mod(t(i), 1) == 0)
                TempMoment(jj) = TMax(mm, gg, i);
                TempOmega(jj) = omega(mm, gg, i);
                jj = jj + 1;
            end
        end
        plot(TempMoment, TempOmega)
    end
end

% for i = 1: length(t)
%     Tm(i) = TMax(1,1,i);        
% end
% plot(t,v*1000,t,Tm)
% hold on
% plot(t,x*1000)
% grid minor