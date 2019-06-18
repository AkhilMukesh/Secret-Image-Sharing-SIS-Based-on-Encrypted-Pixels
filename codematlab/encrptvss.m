function encrptvss(imgname)

im=imread(imgname);
img=rgb2gray(im);
[r c]=size(img);

fprintf(1,'The orginal image size is %d * %d \n',r,c);

sc=uint8(r/2);
fs=[1:sc];
ss=[(sc+1):r];
subimg1=img(fs,:);
subimg2=img(fs,:);


A=1;
B=20;
C=30;
D=mod((B*C-1),256);

[sc1 cc1]=size(subimg1);
R1=uint8(rand(sc1,cc1)*100);



for i=1:sc1
   
    for j=1:cc1
        if (j+1)<=cc1
            P1=subimg1(i,j);
            P2=subimg1(i,j+1);
            X=P1+A;
            Y=P2+D;
            I1=mod((A*X+B*Y),256);
            I2=mod((C*X+D*Y),256);
            subimg1(i,j) = bitxor(I1,R1(i,j));
            subimg1(i,j+1) = bitxor(I2,R1(i,j+1));
            j=j+1;
        end
    end
    
end


[sc2 cc2]=size(subimg2);
R2=uint8(rand(sc2,cc2)*100);

for i=1:sc2
    
    for j=1:cc2
        if (j+1)<=cc2
            P1=subimg2(i,j);
            P2=subimg2(i,j+1);
            X=P1+A;
            Y=P2+D;
            I1=mod((A*X+B*Y),256);
            I2=mod((C*X+D*Y),256);
            subimg2(i,j) = bitxor(I1,R1(i,j));
            subimg2(i,j+1) = bitxor(I2,R1(i,j+1));
            j=j+1;
        end
    end
end

imwrite(subimg1,'E1.jpg','Quality',10);
[r c]=size(subimg1);
fprintf(1,'The E1 image size is %d * %d \n',r,c);
figure(1);
imshow(subimg1);
[r c]=size(subimg2);
fprintf(1,'The E2 image size is %d * %d \n',r,c);
imwrite(subimg2,'E2.jpg','Quality',10);
figure(2);
imshow(subimg2);
save result.mat R1 subimg1 subimg2 img 





