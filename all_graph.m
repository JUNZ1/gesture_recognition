%tüm validation ve training grafiklemesi için
epoch=0
k=1;
durdur=0;
while durdur==0;
    close all
run('grafikleme')
c(k)=abs(ans);
run('valid');
m(k)=abs(ans);
m(k)
if m(k)<0.00003 %0.0001
durdur=1
end
epoch=epoch+1
k=k+1
end
figure
hold
plot(abs(c))
plot(abs(m),'k')