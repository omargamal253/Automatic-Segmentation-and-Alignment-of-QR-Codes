function Final_img = Alignment(x,y,i,v)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%imshow(i);
%hold on;
minx=min(x);
maxx=max(x);
miny=min(y);
maxy=max(y);

p1=[x(1);y(1)];
p2=[x(2);y(2)];
p3=[x(3);y(3)];

s1=sqrt(((p2(1)-p1(1))^2+(p2(2)-p1(2))^2));
s2=sqrt(((p2(1)-p3(1))^2+(p2(2)-p3(2))^2));
s3=sqrt(((p1(1)-p3(1))^2+(p1(2)-p3(2))^2));

S=sort([s1;s2;s3]);

th=S(2)-S(1)+10;

figure('Name','The Top Right Corner'),imshow(i);
hold on;


if abs(s1-s2)<th
plot(p2(1),p2(2),'r-o')

pc=p2;
pnc1=p1;
pnc2=p3;
elseif abs(s1-s3)<th
plot(p1(1),p1(2),'r-o')

pc=p1;
pnc1=p2;
pnc2=p3;
else
plot(p3(1),p3(2),'r-o')

pc=p3;
pnc1=p1;
pnc2=p2;
end

new=[0 floor(S(1)) 0;0 0 floor(S(1)) ;ones(1,3)];

if abs(pc(1)-minx)<10
if pnc1(2)>= pc(2)
old=[pc , pnc2, pnc1 ;ones(1,3)];
else
old=[pc , pnc1, pnc2 ;ones(1,3)];
end

elseif abs(pc(1)-maxx)<10
if pnc1(2)<= pc(2)
old=[pc  , pnc2 , pnc1 ;ones(1,3)];
else
old=[pc , pnc1 , pnc2 ;ones(1,3)];
end

elseif abs(pc(2)-miny)<10
if pnc1(1)<= pc(1)

old=[pc , pnc2 , pnc1 ;ones(1,3)];
else
old=[pc , pnc1 , pnc2 ;ones(1,3)];
end

elseif abs(pc(2)-maxy)<10
if pnc1(1)>= pc(1)
old=[pc, pnc2 , pnc1 ;ones(1,3)];
else

old=[pc  , pnc1 ,  pnc2  ;ones(1,3)];

end

end

v=floor(v+4);
Final_img = Warp(i,old,new,v);
figure('Name','The Final Image'),imshow(Final_img);
end

