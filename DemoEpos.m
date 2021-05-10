Motor1 = Epos4(1,0);
Motor1.EnableNode;
Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
%Motor1.SetOperationMode( OperationModes.ProfilePositionMode );
Motor1.ClearErrorState;
n= 2;
while n>1 && n<300
     Motor1.MotionInVelocity(-400);
     n = n+1;
     %i = Motor1.ActualPosition
     %if i > 0
        % delete(Motor1);
    % end
end
delete(Motor1);
%Motor1.SetOperationMode(OperationModes.CurrentMode);
%Motor1.MotionWithCurrent(100)

% %% P5 project
% Motor1 = Epos4(1,0);
% Motor1.EnableNode;
% Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
% %Motor1.SetOperationMode( OperationModes.ProfilePositionMode );
% Motor1.ClearErrorState;
% 
% countMyos = 1; % number of myos connected
% 
% mm = MyoMex(countMyos);
% m = mm.myoData(1); 
% m.timeIMU
% T = 3; % seconds
% %m.clearLogs()
% m.startStreaming();
% pause(T);
% m.stopStreaming();
% go = true;
% while go
%      while m.pose_wave_in == true
%         Motor1.MotionInVelocity(500);
%         %Motor1.MotionInPosition(1000);
%      end
%      delete(Motor1);
%      Motor1 = Epos4(1,0);
%      Motor1.EnableNode;
%      while m.pose_wave_out == true
%         Motor1.MotionInVelocity(-500);
%         %Motor1.MotionInPosition(0);
%      end
%      delete(Motor1);
%      Motor1 = Epos4(1,0);
%      Motor1.EnableNode;
%      if m.pose_fist == true
%         Motor1.Stop;
%         go=false
%      end
% end
% delete(Motor1);
% mm.delete;
%___________________________________
% Position limiter
% Motor1 = Epos4(1,0);
% Motor1.EnableNode;
% Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
% %Motor1.SetOperationMode( OperationModes.ProfilePositionMode );
% Motor1.ClearErrorState;
% n= 2;
% while n>1 && n<400
%      Motor1.MotionInVelocity(1000);
%      n = n+1;
%      i = Motor1.ActualPosition
%      %if i > 0
%         % delete(Motor1);
%     % end
% end
% delete(Motor1);
%%
%____________________________________________
% Motor1 = Epos4(1,0);
% Motor1.EnableNode;
% Motor1.SetOperationMode(OperationModes.CurrentMode);
% %Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
% Motor1.ClearErrorState;
% %Motor1.MotionInVelocity(1000);
% 
% n= 2;
% while n>1 && n<500
%      Motor1.MotionWithCurrent(1000);
%      n = n+1
%      i = Motor1.ActualCurrent
% end
%Motor1.SetOperationMode(OperationModes.CurrentMode);
%Motor1.MotionWithCurrent(100)

% clc
% clear
% k = 0;
% while true
%     k = k + 1;
% Motor1 = Epos4(1,0);
% Motor1.EnableNode;
% 
% %% myo stuff
% Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
% Motor1.ClearErrorState;
% 
% countMyos = 1; % number of myos connected
% 
% mm = MyoMex(countMyos);
% m = mm.myoData(1);
% m.timeIMU
% T = 3; % seconds
% %m.clearLogs()
% m.startStreaming();
% pause(T);
% m.stopStreaming();
% 
% while m.pose_fist == true
%     Motor1.MotionInVelocity(1000, 200);
% end
% 
%     if k > randi(999,1)
%         break
%     end
%     disp(k)
% 
% disp('End of Times reached ...')
% while m.pose_wave_out == true
%     Motor1.MotionInVelocity(-1000, 200);
% end
% mm.delete;
% end

%% Test motor
% Motor1 = Epos4(1,0);
% Motor1.SetOperationMode(OperationModes.ProfilePositionMode);
% 
% Motor1.EnableNode;
% Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
% Motor1.ClearErrorState;
% n= 2;
% while n>1 && n<500
%     Motor1.MotionInVelocity(1000, 200);
%     n = n+1
% end
% Motor1.MotionInVelocity(0, 200);

%%
%Motor1.MotionInPosition(2000);
%Motor1.WaitUntilDone(10000);
%Motor1.MotionInPosition(-2000);
%Motor1.WaitUntilDone(10000);

%Motor1.MotionInPosition(30000,2,20,1);
%Motor1.WaitUntilDone(10000);

%Motor1.MotionInPosition(-30000,2,20,1);
%Motor1.WaitUntilDone(10000);

%Motor1.MotionInPosition(0,2,20,1);
%Motor1.WaitUntilDone(10000);

%delete(Motor1);