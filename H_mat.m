    function h=H_mat(xa,r,b,l,swi)
if swi==0
for i=1:length(l)
    if i==1
    H_1=[-r(1,i)*cos(b(1,i)+xa(3))/r(1,i) ,-r(1,i)*sin(b(1,i)+xa(3))/r(1,i), 0;
            r(1,i)*sin(b(1,i)+xa(3))/(r(1,i))^2 ,-r(1,i)*cos(b(1,i)+xa(3))/(r(1,i))^2, -1];
    elseif i==2
    H_2=[-r(1,i)*cos(b(1,i)+xa(3))/r(1,i) ,-r(1,i)*sin(b(1,i)+xa(3))/r(1,i), 0;
            r(1,i)*sin(b(1,i)+xa(3))/(r(1,i))^2 ,-r(1,i)*cos(b(1,i)+xa(3))/(r(1,i))^2, -1];
    elseif i==3
     H_3=[-r(1,i)*cos(b(1,i)+xa(3))/r(1,i) ,-r(1,i)*sin(b(1,i)+xa(3))/r(1,i), 0;
            r(1,i)*sin(b(1,i)+xa(3))/(r(1,i))^2 ,-r(1,i)*cos(b(1,i)+xa(3))/(r(1,i))^2, -1];
    elseif i==4
     H_4=[-r(1,i)*cos(b(1,i)+xa(3))/r(1,i) ,-r(1,i)*sin(b(1,i)+xa(3))/r(1,i), 0;
            r(1,i)*sin(b(1,i)+xa(3))/(r(1,i))^2 ,-r(1,i)*cos(b(1,i)+xa(3))/(r(1,i))^2, -1];
    elseif i==5
     H_5=[-r(1,i)*cos(b(1,i)+xa(3))/r(1,i) ,-r(1,i)*sin(b(1,i)+xa(3))/r(1,i), 0;
            r(1,i)*sin(b(1,i)+xa(3))/(r(1,i))^2 ,-r(1,i)*cos(b(1,i)+xa(3))/(r(1,i))^2, -1];
    elseif i==6
     H_6=[-r(1,i)*cos(b(1,i)+xa(3))/r(1,i) ,-r(1,i)*sin(b(1,i)+xa(3))/r(1,i), 0;
            r(1,i)*sin(b(1,i)+xa(3))/(r(1,i))^2 ,-r(1,i)*cos(b(1,i)+xa(3))/(r(1,i))^2, -1];
    end

end

    h=[H_1;H_2;H_3;H_4;H_5;H_6];

else 
       h=[-r(1,swi)*cos(b(1,swi)+xa(3))/r(1,swi) ,-r(1,swi)*sin(b(1,swi)+xa(3))/r(1,swi), 0;
            r(1,swi)*sin(b(1,swi)+xa(3))/(r(1,swi))^2 ,-r(1,swi)*cos(b(1,swi)+xa(3))/(r(1,swi))^2, -1];
end