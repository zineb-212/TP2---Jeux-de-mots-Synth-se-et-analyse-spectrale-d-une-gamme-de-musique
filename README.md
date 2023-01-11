# TP2---Jeux de mots-Synthse et analyse spectrale d'une gamme de musique
## Objectifs
 -  Comprendre comment manipuler un signal audio avec Matlab, en effectuant certaines opérations classiques sur un fichier audio d’une phrase enregistrée via un smartphone.
-  Comprendre la notion des sons purs à travers la synthèse et l’analyse spectrale d’une gamme de musique.

## Jeux de mots

« phrase.wave » est un fichier audio enregistré à l’aide d’un smartphone, en prononçant lentement la phrase : 
 **« Rien ne sert de courir, il faut partir à point »**
 
 1-Chargement du fichier avec la commande *audioread*.
 ```matlab
 [y,fs]=audioread("audio.opus");
 
```
2-Representation du signal en fonction du temps,

```matlab
 [y,fs]=audioread("jeudemots.wav");
 N = length(y)
 ts = 1/fs
 t = (0:N-1)*ts;
 plot(t,y)
```
<img width="811" alt="1" src="https://user-images.githubusercontent.com/121026257/211885620-b186c0ad-b91e-4b01-a731-775e0203b5f1.PNG">

 >Lecture de l'audio.
 
```matlab
sound(y,fs)
```
https://user-images.githubusercontent.com/121026257/211887058-985249c4-4bc5-454a-bec1-916bde2567f8.mp4

3-Modification de la fréquence d’échantillonnage 
>Compression
```matlab 
sound(y,2*Fs); %Donald Duck
```
https://user-images.githubusercontent.com/121026257/211887930-d070e4c2-7529-4171-8663-ee692d3f25fe.mp4
>Dilatation
```matlab 
sound(y,fs*0.5); %Terminator
```
https://user-images.githubusercontent.com/121026257/211888452-476e0d05-7999-430d-a781-0b49c47690af.mp4


5-Creation d'un segment contenant la partie *"Rien ne sert de"* et sa lecture.
```matlab
 rien_ne_sert_de = y(5055:158000);
 plot(rien_ne_sert_de);
 title('Rien ne sert de');
 sound(rien_ne_sert_de,fs);
```
<img width="823" alt="2" src="https://user-images.githubusercontent.com/121026257/211888973-358b45af-e9b2-4387-8a7c-b8373e8965b6.PNG">
https://user-images.githubusercontent.com/121026257/211890095-47fcc2a2-71a1-4ce2-9681-e2193c880682.mp4

6-Segmentation de toute la phrase et son réordonnement.
```matlab
rien_ne_sert_de = y(5055:158000);
 courir  = y(158000:200000);
 il_faut = y(200000:250670); 
 partir_a_point  = y(250670:390760);
 vect =[rien_ne_sert_de partir_a_point il_faut courir];
 sound(vect,fs);
```
https://user-images.githubusercontent.com/121026257/211891174-c65c37c7-4fcd-429b-ba2d-b76c9bf7f5df.mp4

# Synthèse et analyse spectrale d’une gamme de musique

- **Synthèse d’une gamme de musique**

>Les notes de musique produites par un piano peuvent être synthétisées approximativement numériquement. En effet, chaque note peut être considérée comme étant un son pur >produit par un signal sinusoïdal. La fréquence de la note « La » est par exemple de 440 Hz.

1- Créez un programme qui permet de jouer une gamme de musique. La fréquence de chaque note est précisée dans le tableau ci-dessous. Chaque note aura une durée de 1s. La durée de la gamme sera donc de 8s. La fréquence d’échantillonnage fe sera fixée à 8192 Hz.

 Dol  | Ré  | Mi  | Fa  | Sol  | la  | Si  | Do2  |
|---|---|---|---|---|---|---|---|
| 262 Hz  | 294 Hz  | 330 Hz  | 349 Hz  | 392 Hz  | 440 Hz  | 494 Hz  | 523 Hz  |

```matlab
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
```
https://user-images.githubusercontent.com/121026257/211894374-d1311e32-6fa1-4b93-9fe6-b8d7c6ccca90.mp4

- **Synthèse d’une gamme de musique**

2-Utilisation de l'outil *SignalAnalyzer* por tracer le spectre et le spectrogramme de la gamme

<img width="545" alt="3" src="https://user-images.githubusercontent.com/121026257/211925256-cca0af2b-5dc9-4546-93a0-16a8ed67729b.PNG">

- **Approximation du spectre d’un signal sinusoïdal à temps continu**
>Le spectre d’un signal à temps continu peut être approché par transformée de Fourier discrète (TFD) ou sa version rapide (Fast Fourier Transform (FFT).
4- Affichage du spectre de fréquence de la gamme musicale crée en échelle linéaire, puis avec une échelle en décibels.
```matlab
 DS=abs(fft(gamme));
 N=length(gamme)
 subplot(2,1,1)
 plot(DS); %avec une échelle en linéaire.
 k=mag2db(DS);
 subplot(2,1,2)
 fshift=(-N/2:N/2 -1 )*fe/N;
 plot(fshift,fftshift(k)); %avec une échelle en décibels.
```


# 
