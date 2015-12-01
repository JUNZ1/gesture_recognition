w=rand(3,5);
v=rand(1,3);
hidden=ones(1,3);
bias=0;
carpan2=ones(1,3);
alfa=0.7;
top_e=0;
q=11000;
figure
hold
%--------------------------------------------------------------------------
%Training set giriþi ve outputu

for x=1:17;
    train_in=normalize_input(x,1:5);
    decided_o=normalize_input(x,6);
   
   for a=1:3;
    carpan=transpose(w(a,1:5));
    hidden(a)=train_in*carpan;
   end
  %yukarýdaki hidden ýn inputu aþagýdaki outputu
   hidden_out=(1-exp(-2*hidden))./(1+exp(-2*hidden));
 %buraya kadar hidden lyerýmýz tamamlandý son lyer a gönderime hazýr
 %weriler þimdi son lyere gidecek...
 %---------------------------------------------------------------------
 
trps=transpose(v);
tout_in=hidden_out*trps+bias;

actual_o=(1-exp(-2*tout_in))./(1+exp(-2*tout_in)); %3. lyerin outputu

%back propagation kýsmý burada baþlýyor...
error= decided_o-actual_o;

top_e=error+top_e;
sv= error * 4*exp(-2*tout_in)/ (1+exp(-2*tout_in))^2;

% v lerdeki düzeltim miktarý...

delta_v=alfa*sv*hidden_out;

% bias taki deðiþim miktarýný sonradan eklemeyi unutma..

s_in=sv*v;

%w larýn error informationu

% f'(hidden input) hesaplanacak þimdi oda carpan2 diye geçiyor
for p=1:3;
    carpan2(p)= (4*exp(-2*hidden(p))) /((1+exp(-2*hidden(p)))^2);

end

%w larýn error information term i H olursa 

H= s_in.*carpan2;

%þimdide w lardaki deðiþim miktarýna bakacaz

%deðiþim miktarý delta_w olsun

delta_w=(transpose(H)*train_in);
delta_w=delta_w*alfa;

w=w+delta_w;
v=v+delta_v;

stem((x),(decided_o),'k');

stem((x),(actual_o));

end
toplam_error=abs(top_e)
