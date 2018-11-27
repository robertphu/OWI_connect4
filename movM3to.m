
function [] = movM3to(analogvalue )
% Robot ELBOE
% function to move M2's analog reading to the desiged value
global ard enM3 M3a M3b sensM3;
bound = 4;
% Checks current analog reading
m3=floor((readVoltage(ard, sensM3))*(1023/5));
    % if already at analog value, do nothing
    if (m3<(analogvalue + bound)) && (m3>(analogvalue - bound))        
        disp('Already there')
    end
    while(~inRange(m3, analogvalue-bound, analogvalue+bound))
        if m3 >= (analogvalue + bound)
        % lower current analog to analogvalue & stop
        while(m3 >= (analogvalue + bound))
            disp(m3)
            disp('moving m3 down')
            writePWMDutyCycle(ard, enM3, .3); 
            writeDigitalPin(ard, M3a, 0);
            writeDigitalPin(ard, M3b, 1);
            pause(.05);
            writePWMDutyCycle(ard, enM3, 0);
            writeDigitalPin(ard, M3a, 0);
            writeDigitalPin(ard, M3a, 0);
            pause(.25);
            m3=floor((readVoltage(ard, sensM3))*(1023/5));
        end
        elseif m3 <= (analogvalue - bound)
            % raise current analog to analogvalue & stop
            while(m3 <= (analogvalue - bound))
                disp(m3)
                disp('moving m3 up')
                writePWMDutyCycle(ard, enM3, .5); 
                writeDigitalPin(ard, M3a, 1);
                writeDigitalPin(ard, M3b, 0);
                pause(.05);
                writePWMDutyCycle(ard, enM3, 0);
                writeDigitalPin(ard, M3a, 0);
                writeDigitalPin(ard, M3a, 0);
                pause(.25);
                m3=floor((readVoltage(ard, sensM3))*(1023/5));
            end
        end
        m3=floor((readVoltage(ard, sensM3))*(1023/5));
    end
    % turn motor off
    m3=floor((readVoltage(ard, sensM3))*(1023/5));
    disp(m3)
    writePWMDutyCycle(ard, enM3, 0); 
    writeDigitalPin(ard, M3a, 0);
    writeDigitalPin(ard, M3a, 0);
    disp('finish')
end