%% ME618 - Homework 02
% Name: Eric Dougert
% Instructor: Samaneh Farokhirad
% File: Chapter 3 Problems
% Description: Solving Chapter 3 Problems using MATLAB

%% Question 1 
% Convert the following base-2 numbers to base-10:
% (a) 101101 (b) 101.011 (c) 0.01101
clc; clear; close all;

% This is a function that converts a binary number (as a string) into a decimal
function DecimalNumber = binaryToDecimal(BinNumber) 

% Finds and stores the position of the decimnal point
PosDecimal = find(BinNumber == '.',1);

% Initialize decimal value
DecimalNumber = 0;

% If there is no decimal point, it's an integer
if isempty(PosDecimal)
    len = length(BinNumber);
    for i = 1:len
        bit = str2double(BinNumber(i)); % Convert character to number 
        power = len - i; % Power of 2 decreases from left to right
        DecimalNumber = DecimalNumber + bit * 2^power;
    end
else % If there's a decimal point, split integer and fractional parts
    integerPart = BinNumber(1:PosDecimal-1);
    fractionPart = BinNumber(PosDecimal+1:end);

    % Similarly convert the integer part 
    len = length(integerPart);
    for i = 1:len
        bit = str2double(integerPart(i));
        power = len - i;
        DecimalNumber = DecimalNumber + bit * 2^power;
    end

    % Convert the fractional part 
    lenFrac = length(fractionPart);
    for i = 1:lenFrac
        bit = str2double(fractionPart(i));
        power = -i; % Negative exponent for decimal part
        DecimalNumber = DecimalNumber + bit * 2^power;
    end
end
end

% Test cases (a) (b) (c)
disp(binaryToDecimal('101101'))
disp(binaryToDecimal('101.011'))
disp(binaryToDecimal('0.01101'))

