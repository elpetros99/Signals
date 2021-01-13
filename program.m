%Irineos Michael
%el18705
%Askisi 1

%1.1
a=1;
b1=(1/3)*ones(1,3);
b2=(1/5)*ones(1,5);
b3=(1/11)*ones(1,11);
%apokrousi platous kai fasis
figure(1);
freqz(b1,a);
figure(2);
freqz(b2,a);
figure(3);
freqz(b3,a);

[b1,a] = eqtflength(b1,a);
[b2,a] = eqtflength(b2,a);
[b3,a] = eqtflength(b3,a);
[z1,p1]=tf2zp(b1,a);
[z2,p2]=tf2zp(b2,a);
[z3,p3]=tf2zp(b3,a);
zpd(z1,p1);
figure(4);
zpd(z2,p2);
figure(5);
zpd(z3,p3);
figure(6);

%1.2
%a)
p1=[0.68+0.51i 0.68-0.51i];
z1=[1.2 -0.6]';
zpd(z,p);
figure (7);  
%b)
[b4,a4]=zp2tf(zeros,poles,1);
figure(8);
freqz(b4,a4);

%g)
figure(9);
impz(b4,a4);
figure(10);
stepz(b4,a4);

%d)

poles1=[0.76+0.57i 0.76-0.57i];
poles2=[0.8+0.6i 0.8-0.6i];
poles3=[0.84+0.63i 0.84-0.63i];
%Metatropi polon kai midenikon
[b4a,a4a]=zp2tf(z1,poles1,1);
[b4b,a4b]=zp2tf(z1,poles2,1);
[b4c,a4c]=zp2tf(z1,poles3,1);
%Sxediasmos antistixon kroustikon kai bimatikis
figure(11);
stepz(b4a,a4a);
figure(12);
stepz(b4b,a4b);
figure(13);
stepz(b4c,a4c);
figure(14);
freqz(b4a,a4a);
figure(15);
zpd(z1,poles1);
figure(16);
zpd(z1,poles2);
figure(17);
zpd(z1,poles3);

%e) 
[kroustiki1,periodos1]=gensig('pulse',50,100,1); 
[kroustiki2,periodos2]=gensig('pulse',5,100,1);  
diegersi1=filter(b4,a4,kroustiki1); 
diegersi2=filter(b4,a4,kroustiki2); 
figure(18);
plot(periodos1,diegersi1) %Gia T=50
figure(19);
plot(periodos2,diegersi2);%Gia T=5;


%st)
polos1=[0.8i , -0.8i];
figure(20);
zpd(z1,polos1);
[b4d,a4d]=zp2tf(z1,polos1,1);
figure(21);
freqz(b4d,a4d);

%Askisi 2  .
[y1,f1]=audioread('cello_note.wav');
[y2,f2]=audioread('clarinet_note.wav');
[y3,f3]=audioread('flute_note.wav');
%Anaparagogi arxion ixou.
sound(y1,f1);
sound(y2,f2);
sound(y3,f3);
%Apokopi apospasmatos
%b)
%cello
t1=linspace(0,9999/f1,10000);
y1cut=y1(1:10000);
figure(22);
plot(t1,y1cut);

%clarine 
t2=linspace(0,9999/f2,10000);
y2cut=y2(1:10000);
figure(23);
plot(t2,y2cut);


%flute
t3=linspace(0,999/f1,1000);
y3cut=y3(1:1000);
figure(24);
plot(t3,y3cut);

%sxediasmos fasmatos gia entopismo sixnotitas kai epalithefsi me periodo
%fasma cello 
n1=length(y1);
y1fft = fft(y1,n1);
figure(25);
plot(abs(y1fft));

%fasma clarine
%giati einai diarkias 2 defterolepton tha ergastume diaforetika 
n2=length(y2);
y2fft = fft(y2,n2);
df2=n2/f2;
w2=(0:n2-1)*df2;
figure(26);
plot(w2,abs(y2fft));

%fasma flute
n3=length(y3);
y3fft = fft(y3,n3);
df3=n3/f3;
w3=(0:n3-1)*df3;
figure(27);
plot(w3,abs(y3fft))


%e)
[ytho,ftho]=audioread('cello_note_noisy.wav');
n4 = length(ytho);
df4=ftho/n4;
w4=(0:n4-1)*df4;
y4fft = fft(ytho,n4);
figure(28);
plot(w4,abs(y4fft));



%st)
a=1;
b=(1/7)*ones(1,7);
yfil=filter(b,a,yg);
p=audioplayer(yg,fg);
pfil=audioplayer(yfil,fg);
p.play
pfil.play
%fasmo filtrarismenou simatos 
y5fft=fft(yfil,n4)/n4;
figure(29);
plot(w4,abs(y5fft));


%z)
%Tha apomonosoume thn 9h armoniki
[yce,fce]=audioread('cello_note.wav'); %fortosi arxiou
%metatropi se frequency plot
ycefft9=abs(fft(yce));
n=length(ycefft9);
figure(30);
plot([0:1/(n/2 -1):1],ycefft9(1:n/2));
%me vasi to fasma vriskoume tin antistixi periodo kai ftiaxnume to filtro
[b1,a1]= butter(4,[0.0948,0.1015],'bandpass');
yfil9=filter(b1,a1,yce);
y9fft=fft(yfil9);
figure(31);
plot(abs(y9fft));
%apokopi simatos sto pedio tou xronou
t9=linspace(0,999/f1,1000);
yfil9cut=yfil9(1:1000);
figure(32);
plot(t9,yfil9cut);

%apomonosi 6hs armonikis 
[b2,a2]=butter(4,[0.06346,0.068938],'bandpass');
yfil6=filter(b2,a2,yce);
y6fft=fft(yfil6);
figure(33);
plot(abs(y6fft));
t6=linspace(0,999/f1,1000);
yfil6cut=yfil6(1:1000);
figure(34);
plot(t6,yfil6cut);


%sto pedio tou xronou
t6=linspace(0,999/f1,1000);
yfil6cut=yfil6(1:1000);
figure(35);
plot(t6,yfil6cut);

%Askisi 2.2 
[y2,f2]=audioread('clarinet_note.wav');
%a)
t10=linspace(0,38.2-3.82*10^-3,10000);
y10=y2(1:10000);
figure(36);
plot(t10,y10);

%2.2  b)Ypologismos sintelesti platous

y11fft=fft(y10);
figure (37);
plot(abs(y11fft));
c1=abs(y11fft(60));
c=[abs(y11fft(60))/c1,abs(y11fft(179))/c1,abs(y11fft(297))/c1,abs(y11fft(416))/c1];
f=[angle(y11fft(60)),angle(y11fft(179)),angle(y11fft(297)),angle(y11fft(416))];
t=linspace(0,2,88200);
x1=c(1)*cos(2*pi*261.2*t+f(1));
x2=c(2)*cos(2*pi*2*261.2*t+f(2));
x3=c(3)*cos(2*pi*3*261.2*t+f(3));
x4=c(4)*cos(2*pi*4*261.2*t+f(4));
xtest=2.3+x1+x2+x3+x4;
newaudio=audioplayer(xtest,44100);

