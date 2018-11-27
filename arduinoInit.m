% function to initalize my arduino setup
function [] = arduinoInit( )
clear all;

global ard enM1 enM2 enM3 enM4 enM5 enM6 M1a M1b M2a M2b M3a ...
    M3b M4a M4b M5a M5b sensM1 sensM2 sensM3 sensM4 sensM5;

ard = arduino('COM4','mega2560');

% pin setup
enM1 = 'D2';
enM2 = 'D3';
enM3 = 'D4';
enM4 = 'D5';
enM5 = 'D6';
enM6 = 'D7';
M1a = 'D22';
M1b = 'D23';
M2a = 'D24';
M2b = 'D25';
M3a = 'D26';
M3b = 'D27';
M4a = 'D28';
M4b = 'D29';
M5a = 'D30';
M5b = 'D31';
sensM1 = 'A1';
sensM2 = 'A2';
sensM3 = 'A0';
sensM4 = 'A7';
sensM5 = 'A5';

% motor enable pins
configurePin(ard,enM1,'PWM');
configurePin(ard,enM2,'PWM');
configurePin(ard,enM3,'PWM');
configurePin(ard,enM4,'PWM');
configurePin(ard,enM5,'PWM');

% motor direction pins
configurePin(ard,M1a,'DigitalOutput');
configurePin(ard,M1b,'DigitalOutput');
configurePin(ard,M2a,'DigitalOutput');
configurePin(ard,M2b,'DigitalOutput');
configurePin(ard,M3a,'DigitalOutput');
configurePin(ard,M3b,'DigitalOutput');
configurePin(ard,M4a,'DigitalOutput');
configurePin(ard,M4b,'DigitalOutput');
configurePin(ard,M5a,'DigitalOutput');
configurePin(ard,M5b,'DigitalOutput');

% vcc and ground pins for potentiometer
configurePin(ard,'D44','DigitalOutput');
configurePin(ard,'D45','DigitalOutput');
configurePin(ard,'D46','DigitalOutput');
configurePin(ard,'D47','DigitalOutput');
configurePin(ard,'D48','DigitalOutput');
configurePin(ard,'D49','DigitalOutput');
configurePin(ard,'D50','DigitalOutput');
configurePin(ard,'D51','DigitalOutput');
configurePin(ard,'D52','DigitalOutput');
configurePin(ard,'D53','DigitalOutput');

% adc input
configurePin(ard,sensM1,'AnalogInput');
configurePin(ard,sensM2,'AnalogInput');
configurePin(ard,sensM3,'AnalogInput');
configurePin(ard,sensM4,'AnalogInput');
configurePin(ard,sensM5,'AnalogInput');

% HIGH pins for potentiometer
writeDigitalPin(ard, 'D44', 1);
writeDigitalPin(ard, 'D46', 1);
writeDigitalPin(ard, 'D48', 1);
writeDigitalPin(ard, 'D50', 1);
writeDigitalPin(ard, 'D52', 1);

% LOW pins for potentiometer
writeDigitalPin(ard, 'D45', 0);
writeDigitalPin(ard, 'D47', 0);
writeDigitalPin(ard, 'D49', 0);
writeDigitalPin(ard, 'D51', 0);
writeDigitalPin(ard, 'D53', 0);

end