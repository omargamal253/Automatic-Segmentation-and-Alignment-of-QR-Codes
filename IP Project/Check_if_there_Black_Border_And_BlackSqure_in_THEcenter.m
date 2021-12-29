function [HC , Val] = Check_if_there_Black_Border_And_BlackSqure_in_THEcenter(I,Conn_Comp,minx,maxx,miny,maxy,W,H)
%Check if there is Black Border And Black Squre in THE Center or not
%



Val=0;
HC=0;

Invert_Comp = ~Conn_Comp;

Connected_Comp=bwconncomp(Invert_Comp,8);
NUM_Of_Pixels = cellfun(@numel,Connected_Comp.PixelIdxList) ;

% morphology 
if size(NUM_Of_Pixels)==1
Comp_After_morphology = imfill(logical(I),[maxx+2 maxy],8);
else
[X ,Y ] = ind2sub(size(Invert_Comp),Connected_Comp.PixelIdxList{2});
Comp_After_morphology= imfill(logical(I),[minx+X(1)-1 miny+Y(1)-1],8);
end

The_Border=imsubtract(Comp_After_morphology,I);

Conected_for_border = bwconncomp(The_Border,4);

Num_Pixels1 = cellfun(@numel,Conected_for_border.PixelIdxList);

[maximum_Pixels1,index] = max(Num_Pixels1);

if (Conected_for_border.NumObjects)>0  && maximum_Pixels1 >50

[X_for_corner,Y_for_corner] = ind2sub(size(The_Border),Conected_for_border.PixelIdxList{index});

X_min_for_corner=min(X_for_corner);
Y_min_for_corner=min(Y_for_corner);

X_max_for_corner=max(X_for_corner);
Y_max_for_corner=max(Y_for_corner);

H_for_corner=X_max_for_corner-X_min_for_corner;
W_for_corner=Y_max_for_corner-Y_min_for_corner;

x_distance=(W/2-W_for_corner/2)^2;
y_distance=(H/2-H_for_corner/2)^2;
distance=sqrt(x_distance+y_distance);

if distance<25

HC=H_for_corner/2;

Val = Check_If_Square(W_for_corner,H_for_corner);

end


end

end
