
function [] = movM5to(analogvalue )
% ROTATE ALONG BASE
% % % % NOT USED CURRENTLY

% function to move M5's analog reading to the desiged value
global ard enM5 M5a M5b sensM5;
bound = 2;
% Checks current analog reading
m5=floor((readVoltage(ard, sensM5))*(1023/5));
    % if already at analog value, do nothing
    if (m5<(analogvalue + bound)) && (m5>(analogvalue - bound))        
        disp('Already there')
    end
    while(~inRange(m5, analogvalue-bound, analogvalue+bound))
        if m5 >= (analogvalue + bound)
            % lower current analog to analogvalue & stop
            while(m5 >= (analogvalue + bound))
                disp(m5)
                disp('moving m5 down')
                writePWMDutyCycle(ard, enM5, .4); 
                writeDigitalPin(ard, M5a, 1);
                writeDigitalPin(ard, M5b, 0);
                pause(.05);
                writePWMDutyCycle(ard, enM5, 0);
                writeDigitalPin(ard, M5a, 0);
                writeDigitalPin(ard, M5a, 0);
                pause(.125);
                m5=floor((readVoltage(ard, sensM5))*(1023/5));
            end
        elseif m5 <= (analogvalue - bound)
            % raise current analog to analogvalue & stop
            while(m5 <= (analogvalue - bound))
                disp(m5)
                disp('moving m5 up')
                writePWMDutyCycle(ard, enM5, .275); 
                writeDigitalPin(ard, M5a, 0);
                writeDigitalPin(ard, M5b, 1);
                pause(.05);
                writePWMDutyCycle(ard, enM5, 0);
                writeDigitalPin(ard, M5a, 0);
                writeDigitalPin(ard, M5a, 0);
                pause(.125);
                m5=floor((readVoltage(ard, sensM5))*(1023/5));
            end
        end
    end
    % turn motor off
    disp(m5)
    m5=floor((readVoltage(ard, sensM5))*(1023/5));
    disp(m5)
    writePWMDutyCycle(ard, enM5, 0); 
    writeDigitalPin(ard, M5a, 0);
    writeDigitalPin(ard, M5a, 0);
    disp('finish')
end