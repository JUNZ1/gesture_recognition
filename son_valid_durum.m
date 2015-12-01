%ram-prem
valid_er=0;
hidden=ones(1,3);
bias=0;
carpan2=ones(1,3);
alfa=0.7;
top_e=0;
figure
hold
for x=1:10;
    valid_in=validation(x,1:5);
    valid_o=validation(x,6);
   
   for a=1:3;
    carpan=transpose(w(a,1:5));
    hidden(a)=valid_in*carpan;
   end
  %yukarýdaki hidden ýn inputu aþagýdaki outputu
   hidden_out=(1-exp(-2*hidden))./(1+exp(-2*hidden));
 %buraya kadar hidden lyerýmýz tamamlandý son lyer a gönderime hazýr
 %weriler þimdi son lyere gidecek...
 %---------------------------------------------------------------------
 
trps=transpose(v);
tout_in=hidden_out*trps+bias;

actual_o=(1-exp(-2*tout_in))./(1+exp(-2*tout_in)); %3. lyerin outputu
error_v= valid_o-actual_o;
valid_er=valid_er+error_v;
stem(x,valid_o,'k');

stem(x,actual_o);


end
valid_er
