%% Camera Prompt
% 1 = LARGE CIRCLE
% 2 = LARGE SQUARE

function promptCamera ()

missingShape = input('Missing Shape:');
if missingShape == 1
    moveforCircle;
%     disp ('CIR');
    pause (0.1);
    disp ('Camera checking for other missing shapes.');
    pause (0.5);
    promptCamera ();
elseif missingShape == 2
    moveforSquare;
%     disp ('SQR');
    pause (0.1);
    disp ('Camera checking for other missing shapes.');
    pause (0.5);
    promptCamera ();
elseif missingShape == 0
    pause (1);
    disp ('All shapes present.');
    pause (0.1);
    disp ('Mission Successful!');
    return;
end

end