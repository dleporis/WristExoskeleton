%%
function myslider
    figure;
    sld = uicontrol('Style', 'slider',...
        'Min',1,'Max',3,'Value',2,...
        'Units', 'Normalized',...
        'Position', [0.3 0.48 0.4 0.04],...
        'Callback', @print_val,...
        'SliderStep', [1/2 1]);
    CallBack = @(~,b) disp(b.AffectedObject.Value);
    addlistener(sld, 'Value', 'PostSet',CallBack);
end
function print_val(hObject,callbackdata)
    newval = hObject.Value;                         %get value from the slider
    newval = round(newval);                         %round off this value
    set(hObject, 'Value', newval);                  %set slider position to rounded off value
    disp(['Slider moved to ' num2str(newval)]);     %display the value pointed by slider
    if newval == 1
        disp('LEFT')
    end
    if newval == 2
        disp('STOP')
    end
    if newval == 3
        disp('RIGHT')
    end
end

%%
% f = figure;
% p = uipanel(f,'Position',[0.1 0.1 0.35 0.65]);
% c = uicontrol(p,'Style','slider');
% c.Value = 0.5;
% 
% disp(p)
% h = uicontrol('style','slider')
% function slidercb(h,event)
% val = get(h,'value')
% 
% figure
% uicontrol('units','normalized','position',[0.2,0.2,0.5,0.1],...
%   'style','slider','callback',@slidercb)
% end
%%

% CallBack = @(~,b) disp(b.AffectedObject.Value);
% F = figure();
% H = uicontrol(F,'Style','slider');
% addlistener(H, 'Value', 'PostSet',CallBack);
% 
