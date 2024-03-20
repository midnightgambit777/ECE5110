function [normalizedA] = function_normalize(a)
   maxRow = max(abs(a'))';
   normalizedA = a ./ maxRow;
end


