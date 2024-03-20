function [result,err] = function_create_mi(a,ix)
   err = 0;
   result = eye(size(a,1));
   
   for i = ix + 1:size(a,1)
       result(i, ix) = a(i, ix) / a(ix, ix);
   end 
end 

