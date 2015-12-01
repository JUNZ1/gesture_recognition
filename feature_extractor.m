%%%%%%%%%%%%%%%%%%%%%%%Pre Proccessimg%%%%%%%%%%%%%%%%%%
res=imread('C:\work\Neural\DSCF0067.jpg');
sira=27
sinif=8;

figure(1)
imshow(res)
res=double(res);

r=res(:,:,1);
g=res(:,:,2);
b=res(:,:,3);


siz=size(res);
siz_x=siz(2);
siz_y=siz(1);
filt = fspecial('average',[3 3]);

%þimdi fourier dönüþümleri gerçekleþsin
f_res_r=fft2(r,2*siz_y,2*siz_x);
f_res_g=fft2(g,2*siz_y,2*siz_x);
f_res_b=fft2(b,2*siz_y,2*siz_x);

f_filt=fft2(filt,2*siz_y,2*siz_x);


f_filtered_r=f_filt.*f_res_r;
f_filtered_g=f_filt.*f_res_g;
f_filtered_b=f_filt.*f_res_b;
%imshow(real(f_filtered))
filtered(:,:,1)=(real(ifft2(f_filtered_r)));
filtered(:,:,2)=(real(ifft2(f_filtered_g)));
filtered(:,:,3)=(real(ifft2(f_filtered_b)));
filtered=uint8(filtered);
filtered=filtered(1:siz_y,1:siz_x);
figure(2)
imshow(real(filtered))

sb=im2bw(filtered);
figure(3)
imshow(sb)
[lab num]=bwlabel(sb,8);

for k=0:num
   
 [r c]=find(lab==k);
hop=[r,c];
q=size(hop,1)*size(hop,2);

 if q<=5000;
 sb(r,c)=0;
 end
end
figure(4)
imshow(sb)

son=double(sb);


%%%%%%%%%%%Feature Extractor%%%%%%%%%%%%%%%%%%%%%



in=son;
cent = regionprops(in,'Centroid');

merkez=struct2array(cent);
merkez=round(merkez);
merkez_y=merkez(2);
merkez_x=merkez(1);%merkez kordinat%

pix_sayi = regionprops(in,'Area');
pix_sayi=struct2array(pix_sayi); %pixel sayýsý

genislik=regionprops(in,'image');
genislik=struct2array(genislik);
figure(5)
imshow(genislik);

[uzunluk genislik]=size(genislik); %uzunluk geniþlik
%Normalizasyon
merkez_y=merkez_y/320;
merkez_x=merkez_x/240;
pix_sayi=pix_sayi/76800;
genislik=genislik/240;
uzunluk=uzunluk/320;
feature=[merkez_x merkez_y pix_sayi uzunluk genislik]

proto(sira,:)=[feature,sinif];

close all
clear filtered







