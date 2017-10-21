class Flash {
  PImage img;
  PVector pos, dir, vel, target;
  Flash() {
    img = loadImage("flash.png");
    pos = new PVector(width - 200, height - 200);
    vel = new PVector(0, 0);
    target = new PVector(random(width), random(height));
    img.resize(height / 2, 0);
  }
  void show() {
    imageMode(CENTER);
    image(img, pos.x, pos.y);
  } 
  void update(){
  dir = PVector.sub(target, pos);
  dir.normalize();
  dir.setMag(100);
  vel.add(dir);
  vel.limit(80);
  pos.add(vel);
  if(frameCount % 30 == 0)target = new PVector(random(width), random(height));
  }
}