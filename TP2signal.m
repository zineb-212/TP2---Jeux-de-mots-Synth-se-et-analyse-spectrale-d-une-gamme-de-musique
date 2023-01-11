%%
 [y,fs]=audioread("jeudemots.wav");
 N = length(y)
 ts = 1/fs
 t = (0:N-1)*ts;
 plot(t,y)
%%
sound(y,fs)
%%
sound(y,fs*2)%Donald
sound(y,fs*0.5); %Terminator
%%
 rien_ne_sert_de = y(5055:158000);
 plot(rien_ne_sert_de);
 title('Rien ne sert de');
 sound(rien_ne_sert_de,fs);
%%
 rien_ne_sert_de = y(5055:158000);
 courir  = y(158000:200000);
 il_faut = y(200000:250670); 
 partir_a_point  = y(250670:390760);
 sound(rien_ne_sert_de,fs);
 sound(courir,fs);
 sound(il_faut,fs);
 sound(partir_a_point,fs);
%%
 vect =[rien_ne_sert_de partir_a_point il_faut courir];
 sound(vect,fs);
%%
  fe=8192; %fréquence d’échantillonnage
  te=1/fe;
  ts=0:te:1;
  % fréquence de chaque note 
  fdol=262;
  fRe=294;
  fMi=330;
  fFa=349;
  fSol=392;
  fLa=440;
  fSi=494;
  fDo2=523;
   
  DOl=sin(2*fdol*pi*ts);
  RE=sin(2*fRe*pi*ts);  
  MI=sin(2*fMi*pi*ts);
  FA=sin(2*fFa*pi*ts);
  SOL=sin(2*fSol*pi*ts);
  LA=sin(2*fLa*pi*ts);
  SI=sin(2*fSi*pi*ts); 
  DO2=sin(2*fDo2*pi*ts);
  gamme=[DOl RE MI FA SOL LA SI DO2];
  sound (gamme,fe) ;
 %%
 %Approximation du spectre d un signal sinusoïdal à temps continu par FFT
 DS=abs(fft(gamme));
 N=length(gamme)
 subplot(2,1,1)
 plot(DS); %avec une échelle linéaire.
 k=mag2db(DS);
 subplot(2,1,2)
 fshift=(-N/2:N/2 -1 )*fe/N;
 plot(fshift,fftshift(k)); %avec une échelle en décibels.

