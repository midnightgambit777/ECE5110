function [p] = function_create_p(n,i,j)
  p = eye(n)
  r1 = p(i,:);
  r2 = p(j,:);
  p(i,:) = r2;
  p(j,:) = r1;
end 

