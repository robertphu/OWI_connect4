function [] = movM1to(analogvalue )
% 565 closed // 540 open GRIPPER
% function to move M1's analog reading to the desiged value
global ard enM1 M1a M1b sensM1;
bound = 3;
count = 0;
% Checks current analog reading
m1=floor((readVoltage(ard, sensM1))*(1023/5));
    % if already at analog value, do nothing
    if (m1<(analogvalue + bound)) && (m1>(analogvalue - bound))        
        disp('Already there')
    end
    % if in not in range
    while(~inRange(m1, analogvalue-bound, analogvalue+bound))
        if m1 >= (analogvalue + bound)
        % lower current analog to analogvalue & stop
        while(m1 >= (analogvalue + bound))
            disp(m1)
            disp('moving m1 down open gripper')
            writePWMDutyCycle(ard, enM1, .35); 
            writeDigitalPin(ard, M1a, 0);
            writeDigitalPin(ard, M1b, 1);
            pause(.025);
            writePWMDutyCycle(ard, enM1, 0);
            writeDigitalPin(ard, M1a, 0);
            writeDigitalPin(ard, M1a, 0);
            pause(.2);
            m1=floor((readVoltage(ard, sensM1))*(1023/5));
        end
        elseif m1 <= (analogvalue - bound)
            % raise current analog to analogvalue & stop
            while(m1 <= (analogvalue - bound))
                disp(m1)
                disp('moving m1 up close gripper')
                previous = m1;
                writePWMDutyCycle(ard, enM1, .30); 
                writeDigitalPin(ard, M1a, 1);
                writeDigitalPin(ard, M1b, 0);
                pause(.025);
                writePWMDutyCycle(ard, enM1, 0);
                writeDigitalPin(ard, M1a, 0);
                writeDigitalPin(ard, M1a, 0);
                pause(.2);
                m1=floor((readVoltage(ard, sensM1))*(1023/5));
                % if the gripper cannot close anymore
                % the analog reading will stay the same
                % if this happens more than 10 times
                % the gripper is fully closed and cannot
                % close any more
                if (inRange(previous, m1 - 1, m1 + 1))
                     count = count + 1;                
                else count = 0;
                end
                if (count >= 10)
                    break;
                end
                
            end
        end
        if (count >= 10)
            break;
        end
        m1=floor((readVoltage(ard, sensM1))*(1023/5));
    end
    % turn motor off
    m1=floor((readVoltage(ard, sensM1))*(1023/5));
    disp(m1)
    writePWMDutyCycle(ard, enM1, 0); 
    writeDigitalPin(ard, M1a, 0);
    writeDigitalPin(ard, M1a, 0);
    disp('finish')
% end