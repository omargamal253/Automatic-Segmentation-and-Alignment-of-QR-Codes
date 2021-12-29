function Val = Check_If_There_BlackSqure_in_center(I,W,H)
%Check if there is Black squre in the center or not
% I-> The Connected  comp that gets from thresholding image
% W,H -> The W and H for the Connected comp

Val=0;

Invert_I = ~I;

Connected_for_corner = bwconncomp(Invert_I);

NUM_Of_Pixels = cellfun(@numel,Connected_for_corner.PixelIdxList);


if floor(H/2)>0 && floor(W/2)>0

if (Connected_for_corner.NumObjects)>0 && I(floor(H/2),floor(W/2))==0


[~ ,index] = max(NUM_Of_Pixels);

[X_for_corner,Y_for_corner] = ind2sub(size(Invert_I),Connected_for_corner.PixelIdxList{index});

X_min_for_corner=min(X_for_corner);
Y_min_for_corner=min(Y_for_corner);

X_max_for_corner=max(X_for_corner);
Y_max_for_corner=max(Y_for_corner);

H_for_corner=X_max_for_corner-X_min_for_corner;
W_for_corner=Y_max_for_corner-Y_min_for_corner;

Ret_Val=Check_If_Square(W_for_corner,H_for_corner);

if Ret_Val==1
Val=1;
else
Val=0;
end;
end;
end
end