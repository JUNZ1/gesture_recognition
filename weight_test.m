
%w=rand(3,5);
%v=rand(1,3);
hidden=ones(1,3);
bias=0;
carpan2=ones(1,3);
alfa=0.7; %0.7 y i 0.5 yapt�m
top_e=0;
%figure
%hold
%---------------------------------------------------------------------
%Training set giri�i ve outputu


x=20; %hangi validationu vermek istiorsan onu g�nder
prototip=x

   train_in=all_hand(x,1:5);
    decided_o=all_hand(x,6);
   
   for a=1:3;
    carpan=transpose(w(a,1:5));
    hidden(a)=train_in*carpan;
   end
  %yukar�daki hidden �n inputu a�ag�daki outputu
   hidden_out=(1-exp(-2*hidden))./(1+exp(-2*hidden));
 %buraya kadar hidden lyer�m�z tamamland� son lyer a g�nderime haz�r
 %weriler �imdi son lyere gidecek...
 %---------------------------------------------------------------------
 
trps=transpose(v);
tout_in=hidden_out*trps+bias;

actual_o=(1-exp(-2*tout_in))./(1+exp(-2*tout_in))

sinif_numarasi=round(actual_o*10)

