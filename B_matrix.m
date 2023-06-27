function b = B_matrix(x,dt,v)
b=[1 0 -dt*v*sin(x(3));
   0 1 dt*v*cos(x(3));
   0 0 1];
end
