function cmat=h_nl(x,l)

for i=1:1:length(l)
h(:,:,i)=[sqrt((l(i,1)-x(1))^2+(l(i,2)-x(2))^2);
           wrapToPi(atan2(l(i,2)-x(2),l(i,1)-x(1)))-x(3)];
end

cmat=[h(:,:,1);h(:,:,2);h(:,:,3);h(:,:,4);h(:,:,5);h(:,:,6)];