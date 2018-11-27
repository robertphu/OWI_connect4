
function [] = movM4to(analogvalue )
% Robot SHOULDER
% function to move M4's analog reading to the desiged value
global ard enM4 M4a M4b sensM4;
bound = 4;
% Checks current analog reading
m4=floor((readVoltage(ard, sensM4))*(1023/5));
    % if already at analog value, do nothing
    if (m4<(analogvalue + bound)) && (m4>(analogvalue - bound))        
        disp('Already there')
    end
    while(~inRange(m4, analogvalue-bound, analogvalue+bound))
        if m4 >= (analogvalue + bound)
            % lower current analog to analogvalue & stop
            while(m4 >= (analogvalue + bound))
                disp(m4)
                disp('moving m4 down')
                writePWMDutyCycle(ard, enM4, .4); 
                writeDigitalPin(ard, M4a, 0);
                writeDigitalPin(ard, M4b, 1);
                pause(.05);
                writePWMDutyCycle(ard, enM4, 0);
                writeDigitalPin(ard, M4a, 0);
                writeDigitalPin(ard, M4a, 0);
                pause(.125);
                m4=floor((readVoltage(ard, sensM4))*(1023/5));
            end
        elseif m4 <= (analogvalue - bound)
            % raise current analog to analogvalue & stop
            while(m4 <= (analogvalue - bound))
                disp(m4)
                disp('moving m4 up')
                writePWMDutyCycle(ard, enM4, .275); 
                writeDigitalPin(ard, M4a, 1);
                writeDigitalPin(ard, M4b, 0);
                pause(.05);
                writePWMDutyCycle(ard, enM4, 0);
                writeDigitalPin(ard, M4a, 0);
                writeDigitalPin(ard, M4a, 0);
                pause(.125);
                m4=floor((readVoltage(ard, sensM4))*(1023/5));
            end
        end
    end
    % turn motor off
    disp(m4)
    m4=floor((readVoltage(ard, sensM4))*(1023/5));
    disp(m4)
    writePWMDutyCycle(ard, enM4, 0); 
    writeDigitalPin(ard, M4a, 0);
    writeDigitalPin(ard, M4a, 0);
    disp('finish')
end