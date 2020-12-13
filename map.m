function [val] = map(vect, min, max, out_min, out_max)
val = (vect - min) .* (out_max - out_min) ./ (max - min) + out_min;
round(val);
end