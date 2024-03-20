function [result,err] = function_seoq(A,B)
 err = 0;
 result = zeroes(size(B));
 if size(A,1) ~= size(B,1)
     err = -1;
     return;
 end 
 
 an = [A,B];
 
 for ix = 1:size(A,1)
     %normalize the matrix 
     an = function_normalize(an);
     [max_value, max_ix] = max(abs(an(ix:end, ix)));
     
     if max_value == 0
         err = -1;
         return;
     end 
     
     if max_ix + ix - 1 ~= ix
         p = function_create_p(size(A,1), ix, max_ix + ix - 1);
         an = p * an;
     end 
     
     m = function_create_m(an,ix);
     an = m * an;
 end 
 
 %back substitution for an
 %   0.6000  0.8000   1.0000   0.4000   0.4000
 %   0       0.2000   0.4000   1.0000   0.7000
 %   0       0       -1.0000   0.2000  -1.0000
 %   0       0        0        1.0000   0.9184 
 
 for ix = size(A,1):-1:1
     result(ix) = an(ix,end)/an(ix,ix);
     for row = 1: ix - 1
         an(row,end) = an(row,end) - result(ix) * an(row,ix);
     end 
 end 
 
end 

