float[][] SobelX={{-1,-2,-1},{ 0, 0, 0},{  1, 2, 1}};
                 
float[][] SobelY={{ -1, 0, 1},{ -2, 0, 2},{ -1, 0, 1}};

PImage img,morf;


int soglia = 64;

void setup(){
  size(600,400);
  img = loadImage(args[0]);
  morf = loadImage(args[1]);
  println(shapeComparison(img,morf));
  exit();
}


PImage convertToImage(float F[][]){
  PImage R=createImage(F[0].length,F.length,RGB);
  for(int i=0; i<R.width;i++){
    for(int j=0; j<R.height;j++){
      float tmp =constrain((F[j][i]),0,255);
      R.set(i,j,color((tmp))); 
    }
  }
  return R;
}

float[][] convolution(PImage I, float[][] filter){
  float[][] R=new float[I.height][I.width]; 
  int N=filter.length;
  int off=N/2;
  float res;
  PImage tmp;
  for(int i=0; i <I.width;i++){
    for(int j=0;j<I.height;j++){
      tmp=I.get(i-off,j-off,N,N);
      res=0;
      for (int m=0;m<N;m++){
        for(int n=0;n<N;n++){
          res=res+green(tmp.get(n,m))*filter[m][n];
        }
      }
      R[j][i]=res;
    }
  }
  return R;
}


float shapeComparison(PImage img, PImage morf){
  PImage img2,img3,img4,img5,img6,img7,morf2,morf3,morf4,morf5,morf6;
  
  img.resize(width/2,height/2);
  morf.resize(width/2,height/2);
  img.filter(GRAY);
  morf.filter(GRAY);
  
  img2 = convertToImage(convolution(img,SobelX));
  img3 = convertToImage(convolution(img,SobelY));  
  img4 = img.copy();
  img5 = img.copy();
  img6 = img.copy();
  img7 = img.copy();
  morf2 = convertToImage(convolution(morf,SobelX));
  morf3 = convertToImage(convolution(morf,SobelY));
  morf4 = morf.copy();
  morf5 = morf.copy();
  morf6 = morf.copy();
  
  //Binarizzazione img2 ( SobelX di img) = img4
   for(int i = 0; i < img2.pixels.length; i++){
    if(green(img2.pixels[i]) > soglia) img4.pixels[i] = color(255);
    else img4.pixels[i] = color(0);
  }
  
  //Binarizzazione img3 ( SobelY di img) = im5
  for(int i = 0; i < img3.pixels.length; i++){
    if(green(img3.pixels[i]) > soglia) img5.pixels[i] = color(255);
    else img5.pixels[i] = color(0);
  }
   
  // Somma img4(SobelX di img Binarizzato )  + img5 (SobelY di img Binarizzato )  = img6 
  for(int i = 0; i < img6.pixels.length; i++){
    img6.pixels[i] = color(green(img4.pixels[i]) + green(img5.pixels[i]));
  }
  
  //Negativo di img6 = img7
  for(int i = 0; i < img7.pixels.length; i++){
    img7.pixels[i] = color( 255- green(img6.pixels[i]));
  }
  
  //Binarizzazione morf2 ( SobelX di morf )  = morf4
  for(int i = 0; i < morf2.pixels.length;i++){
    if(green(morf2.pixels[i]) > soglia) morf4.pixels[i] = color(255);
    else morf4.pixels[i] = color(0);
  }
  //Binarizzazione morf3 ( SobelY di morf ) = morf5
  for(int i = 0; i < morf3.pixels.length;i++){
    if(green(morf3.pixels[i]) > soglia) morf5.pixels[i] = color(255);
    else morf5.pixels[i] = color(0);
  }
  //Somma morf4 ( SobelX di morf Binarizzato) + morf5( SobelY di morf Binarizzato )  = morf6
  for(int i = 0; i < morf6.pixels.length;i++){
    morf6.pixels[i] = color(green(morf3.pixels[i]) + green(morf4.pixels[i]));
  }
  //Creo array di dimensione = a morf6
  int array[] = new int[morf6.pixels.length];
  
  //Inserisco nell'array la differenza in valore assoluto tra morf6 e img6 pixel per pixel in ordine
  for(int i = 0; i < morf6.pixels.length; i++){
    array[i] = int( abs(green(morf6.pixels[i]) - green(img6.pixels[i])));
  }
  
  float media = 0;
  
  //Sommo tutti i valori dell'array;
  for(int i = 0; i < morf6.pixels.length; i++){
    media+= array[i];
  }
  // Calcolo la media di tutti i valori dell'array dividendo la somma di tutti loro per il numero di valori ( ovvero morf6.pixels.length)
  media = media/morf6.pixels.length;
  return media;
}
