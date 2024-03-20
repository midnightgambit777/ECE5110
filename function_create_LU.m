function [L,U] = function_create_LU(A)
   U = A;
   L = eye(size(A,1));
   
   for ix = 1:size(A,1)
       m = function_create_m(U, ix);
       mi = function_create_mi(U, ix);
       
       U = m * U;
       L = L * mi;
   end 
end 
