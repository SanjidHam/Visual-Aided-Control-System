function [] = laser()

for x = -1.025:0.05:1.025
    line ('XData', [x x], 'YData', [0.5025 0.5025], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
for x = -1.025:0.05:1.025
    line ('XData', [x x], 'YData', [-0.5025 -0.5025], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
for y = -0.5025:0.05:0.5025
    line ('XData', [1.025 1.025], 'YData', [y y], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
for y = -0.5025:0.05:0.5025
    line ('XData', [-1.025 -1.025], 'YData', [y y], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
hold on;

end