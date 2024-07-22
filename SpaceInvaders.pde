Astronave a1;
ArrayList<Nemico> flotta=new ArrayList<Nemico>();
int offsetNemico=50;
PImage nave;
PImage nemico;
float punti;
int numNemici;
int maxNemiciXRiga;

void setup() {
  size(600, 600);
  float yIni = 50;
  int c = 0;
  int i;
  maxNemiciXRiga=6;
  nave=loadImage("amuchina.png");
  nemico=loadImage("coronavirus.png");
  a1=new Astronave();
  numNemici=18;
  for (i=0; i<numNemici; i++) {
    flotta.add(new Nemico(offsetNemico*(c+1), yIni));
    c++;
    if ((i+1)%maxNemiciXRiga == 0) {
      yIni += 50;
      c = 0;
    }
  }
  punti=0;
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==RIGHT) {
      a1.dirX=5;
    } else if (keyCode==LEFT) {
      a1.dirX=-5;
    }
  } else {
    if (key==' ') {
      a1.Spara();
    }
  }
}

void keyReleased() {
  if (key!=' ') {
    a1.dirX=0;
  }
}

void draw() {
  background(50);
  textSize(20);
  text("Punti: "+punti, 20, 20);
  if (flotta.size()>0) {
    a1.Update();
    a1.Show();
    for (int i=a1.caricatore.size() -1; i>=0; i--) {
      for (int j = flotta.size() -1; j>=0; j--) {
        if (i==a1.caricatore.size()) {
          i--;
        }
        if (j==flotta.size()) {
          j--;
        }
        if (a1.caricatore.size()>0&&a1.caricatore.get(i).eColliso(flotta.get(j))) {
          punti+=(height-a1.caricatore.get(i).y);
          flotta.remove(j);
          a1.caricatore.remove(i);
          println("COLPITO!");
        }
      }
    }
    for (int i = flotta.size()-1; i >=0; i--) {
      if (flotta.get(i).eAlBordo()) {
        for (int j = 0; j < flotta.size(); j++) { 
          flotta.get(j).Fall();
        }
        break;
      }
    }
    for (int i=flotta.size()-1; i>=0; i--) {
      flotta.get(i).Update();
      flotta.get(i).Show();
    }
  } else {
    textAlign(CENTER);
    textSize(50);
    text("HAI SCONFITTO IL\nCORONA VIRUS", width/2, height/2-50);
    noLoop();
  }
}
