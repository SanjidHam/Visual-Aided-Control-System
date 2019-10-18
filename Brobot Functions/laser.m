function [] = laser()

for x = -0.25:0.05:0.3
    line ('XData', [x x], 'YData', [0.3 0.3], 'ZData', [0.4493 -0.03073], 'Color', [1 0 0]);
end
for x = -0.25:0.05:0.3
    line ('XData', [x x], 'YData', [-0.3 -0.3], 'ZData', [0.4493 -0.03073], 'Color', [1 0 0]);
end
for y = -0.3:0.05:0.3
    line ('XData', [0.3 0.3], 'YData', [y y], 'ZData', [0.4493 -0.03073], 'Color', [1 0 0]);
end
for y = -0.3:0.05:0.3
    line ('XData', [-0.25 -0.25], 'YData', [y y], 'ZData', [0.4493 -0.03073], 'Color', [1 0 0]);
end
hold on;

end