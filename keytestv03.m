Motor1 = Epos4(1,0);
Motor1.EnableNode;
Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
%Motor1.SetOperationMode( OperationModes.ProfilePositionMode );
Motor1.ClearErrorState;

while k == waitforbuttonpress;
% 28 leftarrow
% 29 rightarrow
% 30 uparrow
% 31 downarrow
value = double(get(gcf,'CurrentCharacter'))
    if value == 28
         Motor1.MotionInVelocity(-400);
    end
    if value == 29
        Motor1.MotionInVelocity(400);
    end
    while value == 0
        Motor1.MotionInVelocity(0);
    end
    if value == 31
         Motor1.MotionInVelocity(0);
    end
end
