class Nemico {

  float x;
  float y;
  float dir;
  float diametro;

  Nemico(float posX, float posY) {
    x=posX;
    y=posY;
    dir=4;
    diametro=40;
  }

  void Update() {
    if(y+diametro>height-40){
      background(50);
      textSize(20);
      text("Punti: "+punti, 67, 20);
      textSize(100);
      textAlign(CENTER);
      text("GAME OVER",width/2,height/2);
      //noLoop();
    }else{
      x+=dir;
    }
  }

  void Show() {
    //fill(0, 255, 0);
    //noStroke();
    //circle(x, y, diametro);
    imageMode(CENTER);
    image(nemico,x,y,diametro*3,diametro*1.);
  }

  void Fall() {
    y+=diametro+5;
    dir=dir*-1;
  }

  boolean eAlBordo() {
    if (this.x>width-diametro/2||this.x<diametro/2) {
      return true;
    } else {
      return false;
    }
  }
  
}
