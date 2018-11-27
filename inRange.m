% Simple function to check if num is in between upper and lower bounds
function [output] = inRange(num , lower, upper)
    if((num >= lower) && (num <= upper))
        output = true;
    else output = false;
    end
end