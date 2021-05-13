clc
addpath('./Resources/')                                                    % directory containing supporting functions

%% definitions

shimmer = ShimmerHandleClass('8');                                     % Define shimmer as a ShimmerHandle Class instance with comPort1
SensorMacros = SetEnabledSensorsMacrosClass;                               % assign user friendly macros for setenabledsensors

%firsttime = true;

%NO_SAMPLES_IN_PLOT = 500;                                                  % Number of samples that will be displayed in the plot at any one time
DELAY_PERIOD = 0.2;                                                        % A delay period of time in seconds between data read operations
%numSamples = 0;
Motor1 = Epos4(1,0);
Motor1.EnableNode;
Motor1.SetOperationMode( OperationModes.ProfileVelocityMode );
%Motor1.SetOperationMode( OperationModes.ProfilePositionMode );
Motor1.ClearErrorState;

%Motor1.SetOperationMode(OperationModes.CurrentMode);
%Motor1.MotionWithCurrent(100)

%%

if shimmer.connect                                                      % TRUE if the shimmer connects
    % Define settings for shimmer
    shimmer.setsamplingrate(100);                                         % Set the shimmer sampling rate to 51.2Hz
    shimmer.setinternalboard('9DOF');                                      % Set the shimmer internal daughter board to '9DOF'
    %shimmer.disableallsensors;                                             % disable all sensors
    shimmer.setenabledsensors(SensorMacros.MAG,1,...  % Enable the shimmer accelerometer, magnetometer, gyroscope and battery voltage monitor
        SensorMacros.GYRO,1);
    shimmer.setaccelrange(2);
    shimmer.start();
    shimmer.setgyrorange(0);
    %shimmer.startdatalogandstream;
    signalNameArray = shimmer.getenabledsignalnames;
end

bool = 1;
plotData = [];
while bool == 1
    [newData,signalNameArray,signalFormatArray,signalUnitArray] = shimmer.getdata('c');
    pause(DELAY_PERIOD);
    iSignal = shimmer.getsignalindex('Accelerometer Y');
    x = find(ismember(signalNameArray, 'Low Noise Accelerometer Y'));
    plotData = [plotData; newData];
    %plot(plotData(:,[x]));
    a = plotData(:,[x]);
    %number = int64(a);
    loop = 1;
    if a > 0
        disp('up')
        plotData = [];
        Motor1.MotionInVelocity(100);
    else
        disp('down')
        plotData = [];
        Motor1.MotionInVelocity(-100);
    end
    if a > -1 & a < 1
        plotData = [];
        Motor1.MotionInVelocity(0);
    end
    if a > 2
        plotData = [];
        Motor1.MotionInVelocity(200);
    end
    if a < -2
        plotData = [];
        Motor1.MotionInVelocity(-200);
    end
end


%     while a > 0 & loop == 1
%         fprintf('pls\n')
%         loop = 0;
%     end
%     loop = 1;
%     while a < 0 & loop == 1
%         fprintf('ye\n')
%         loop = 0;
%     end
%     switch a
%         case a > 0
%             fprintf('pls\n')
%         case a < 0
%             fprintf('ye\n')
%     end

    %plotData(1:end,5)
    %signalName = shimmer.getsignalname(3)

    
% a = magic(10)
% 
% a(1:end,5)
%     
    