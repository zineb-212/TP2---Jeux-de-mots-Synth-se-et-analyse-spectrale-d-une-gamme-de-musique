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

>Dilatation
```matlab 
sound(y,fs*0.5); %Terminator
```

4- Tracez le signal en fonction des indices du vecteur x, puis essayez de repérer les indices de début et de fin de la phrase « Rien ne sert de ».

```matlab
rien_ne_sert_de = y(5055:76000);
plot(rien_ne_sert_de);
title('Rien ne sert de');
```

5- Pour segmenter le premier mot, il faut par exemple créer un vecteur « riennesertde »contenant les n premières valeurs du signal enregistré x qui correspondent à ce 
morceau. Créez ce vecteur, puis écoutez le mot segmenté.

```matlab
rien_ne_sert_de = y(5055:76000);
sound(rien_ne_sert_de,fs);
```

6- Segmentez cette fois-ci toute la phrase en créant les variables suivantes : riennesertde, courir, ilfaut, partirapoint.
```matlab
rien_ne_sert_de = y(5055:76000);
courir  = y(76000:95395);
il_faut = y(95395:141652);
partir_a_point  = y(141652:198500);
```

7- Notez que le signal initial de parole est un vecteur colonne contenant un certain nombre de valeurs (length(x)). Réarrangez ce vecteur pour écouter la phrase synthétisée « Rien ne sert de partir à point, il faut courir ». 

```matlab
vector =[rien_ne_sert_de ; partir_a_point ; il_faut ; courir];
sound(vector,fs);
```


# Synthèse et analyse spectrale d’une gamme de musique

- **Synthèse d’une gamme de musique**

>Les notes de musique produites par un piano peuvent être synthétisées approximativement numériquement. En effet, chaque note peut être considérée comme étant un son pur >produit par un signal sinusoïdal. La fréquence de la note « La » est par exemple de 440 Hz.

1- Créez un programme qui permet de jouer une gamme de musique. La fréquence de chaque note est précisée dans le tableau ci-dessous. Chaque note aura une durée de 1s. La durée de la gamme sera donc de 8s. La fréquence d’échantillonnage fe sera fixée à 8192 Hz.

 Dol  | Ré  | Mi  | Fa  | Sol  | la  | Si  | Do2  |
|---|---|---|---|---|---|---|---|
| 262 Hz  | 294 Hz  | 330 Hz  | 349 Hz  | 392 Hz  | 440 Hz  | 494 Hz  | 523 Hz  |

```matlab
 clear all
  close all
  clc

  fe=8192; %La fréquence d’échantillonnage
  te=1/fe;
  ts=0:te:1;
   
    %La fréquence de chaque note de la gamme
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
  lagamme=[DOl RE MI FA SOL LA SI DO2];
  
  sound (lagamme, fe ) ;
```
- **Synthèse d’une gamme de musique**

2- Utilisez l’outil graphique d’analyse de signaux signalAnalyzer pour visualiser le spectre de votre gamme. Observez les 8 fréquences contenues dans la gamme et vérifiez leur valeur numérique à l’aide des curseurs.

>la Gamme

>le spectre

3- Tracez le spectrogramme qui permet de visualiser le contenu fréquentiel du signal au cours du temps (comme le fait une partition de musique) mais la précision sur l’axe des fréquences n’est pas suffisante pour relever précisément les 8 fréquences.




- **Approximation du spectre d’un signal sinusoïdal à temps continu par FFT**

4- Le spectre d’un signal à temps continu peut être approché par transformée de Fourier discrète (TFD) ou sa version rapide (Fast Fourier Transform (FFT). Afficher le spectre de fréquence de la gamme musicale crée en échelle linéaire, puis avec une échelle en décibels.
```matlab
DS=abs(fft(gamme));
N=length(gamme)
subplot(2,1,1)
plot(DS);
title('Fft de la gamme');
k=mag2db(DS);
subplot(2,1,2)

%avec une échelle en décibels.
fshift=(-N/2:N/2 -1 )*fe/N;
plot(fshift,fftshift(k));
```

# 
