close all
clear all

set(0,'DefaultFigureWindowStyle','docked');
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth', 2);


particles = 1;
ts = 500;
x = zeros(particles, ts);
v = zeros(particles, ts);
t = linspace(0,ts-1,ts);

vavg = 0;
vavgs = zeros(particles, ts);

force = 1;
scatter = 0.05;

figure(1)
for i = 1:ts
    
    vavg = sum(v(1, 1:i))/i;
    vavgs(1,i) = vavg;
    
    subplot(3,1,1);
    plot(t(1,1:i), v(1,1:i),  'Color', 'k');
    hold on
    plot(t(1,1:i), vavgs(1,1:i),  'Color', 'g');
    hold on
    xlabel('time');
    ylabel('velocity');
    title(sprintf('Average Velocity is %f', vavg));
    
    subplot(3,1,2);
    plot(t(1,1:i), x(1,1:i),  'Color', 'b');
    xlabel('time');
    ylabel('position');
    hold on
    
    subplot(3,1,3);
    plot(x(1,1:i), v(1,1:i), 'Color', 'r');
    xlabel('position');
    ylabel('velocity');
    
    
    if rand() > scatter
        v(1, i+1) = v(1, i) + force;
    else
        v(1, i+1) = 0;
    end
    
    x(1, i+1) = x(1, i) + v(1, i);
    
    pause(0.05);
end