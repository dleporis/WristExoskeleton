clc
addpath('./Resources/')                                                    % directory containing supporting functions

%% definitions

shimmer = ShimmerHandleClass('8');                                     % Define shimmer as a ShimmerHandle Class instance with comPort1
SensorMacros = SetEnabledSensorsMacrosClass;                               % assign user friendly macros for setenabledsensors
                                                 
DELAY_PERIOD = 0.2;                                                        % A delay period of time in seconds between data read operations
Motor1 = Epos4(1,0);
Motor1.EnableNode;
Motor1.SetOperationMode(OperationModes.ProfileVelocityMode);
Motor1.ClearErrorState;

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

n = 50;
m = 50;
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
    i = Motor1.ActualPosition;
    if a > 0
        plotData = [];
        Motor1.MotionInVelocity(100);
    else
        plotData = [];
        Motor1.MotionInVelocity(-100);
    end
    if a > -1 & a < 1
        plotData = [];
        Motor1.MotionInVelocity(0);
    end
    if a > 2
        plotData = [];
        Motor1.MotionInVelocity(250);
    end
    if a < -2
        plotData = [];
        Motor1.MotionInVelocity(-250);
    end
    if i > 17700
        for timer = 1:n
            Motor1.MotionInVelocity(-50);
        end
    end
    if i < -12900
        for timer1 = 1:m
            Motor1.MotionInVelocity(50);
        end
    end
end
    
