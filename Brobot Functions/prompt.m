function prompt()
    missingShape = input('Missing Shape: ');
    if missingShape == 1
        disp('I want to die');
        prompt();
    elseif missingShape == 2
        disp('Robotics is hard');
        prompt();
    elseif missingShape == 0
        disp('Its fkin Friday night');
        return;
    end
end