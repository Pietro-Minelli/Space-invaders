class Astronave {

  float x;
  float y;
  float offset;
  float dirX;
  ArrayList<Proiettile> caricatore=new ArrayList<Proiettile>();

  Astronave() {
    offset=50;
    x=width/2;
    y=height-offset;
    dirX=0;
  }

  void Update() {
    x+=dirX;
    x=constrain(x, 20, width-20);
  }

  void Show() {
    //noStroke();
    //fill(0, 0, 255);
    //rectMode(CENTER);
    //rect(x, y, 20, offset);
    imageMode(CENTER);
    image(nave,x,y,80,offset*2);
    for (int i=caricatore.size()-1; i>=0; i--) {
      caricatore.get(i).Update();
      caricatore.get(i).Show();
      if (caricatore.get(i).y<0) {
        caricatore.remove(i);
      }
    }
  }

  void Spara() {
    if (caricatore.size()<10) {
      caricatore.add(new Proiettile(this.x, this.offset));
    }
  }
  
}
