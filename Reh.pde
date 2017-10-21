class Reh {
  int life = 1;
  PVector pos;  
  PImage img;
  Reh(float x, float y) {
    img = loadImage("03_rothirsch1.png");    
    pos = new PVector(x, y);
  }

  void show() {
    imageMode(CENTER);
    image(img, pos.x, pos.y);
  }
}