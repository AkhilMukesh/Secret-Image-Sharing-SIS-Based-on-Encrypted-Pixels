function img=decryptvss(matfilename)

matfilename
load(matfilename,'-mat');

im1=subimg1;
im2=subimg2;

[r c] =size(im1)

size(im2)
size(R1)

for i=1:r
    for j=1:c

       I1(i,j)=bitxor(im1(i,j),R1(i,j));  
       I2(i,j)=bitxor(im2(i,j),R1(i,j));
    end    
end

A=1;
B=20;
C=30;
D=mod((B*C-1),256);

for i=1:r
    for j=1:c
       if (j+1)<c
       Y=(C*I1(i,j)-I2(i,j))/(B*C-D);
       X=I1(i,j)-B*Y;
       Y=mod(Y,256);
       X=mod(X,256);
       P1=mod((X-A),256);
       P2=mod((Y-D),256);
       IM(i,j)=P1;
       IM(i,j+1)=P2;
       end
       
    end
end

imwrite(img,'recovered.jpg');


