class Proiettile {

  float x;
  float y;
  float dim;
  float velocita;

  Proiettile(float posX, float of) {
    x=posX;
    y=height-of/2*3-20;
    dim=7;
    velocita=-5;
  }

  void Update() {
    y+=velocita;
  }

  void Show() {
    stroke(255);
    strokeWeight(10);
    line(x, y, x, y-dim);
  }

  boolean eColliso(Nemico n1) {
    float distanza=dist(n1.x, n1.y, this.x, this.y);
    float r2=n1.diametro/2;
    if (distanza<=r2) {
      return true;
    } else {
      return false;
    }
  }
  
}
