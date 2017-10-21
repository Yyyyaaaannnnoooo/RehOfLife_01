import ddf.minim.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer muuu, waffe;
Reh reh;
Jaeger jaeger;
ArrayList <Flash> flash;
PImage bg1, bg2, house;
float sinCount = 0;
int toteRehZahler = 0;
PFont lucida;
void setup() {
  size(1200, 800);
  //fullScreen();
  minim = new Minim (this);
  jaeger = new Jaeger();
  reh = new Reh (random(300, width - 300), random(300, height - 300));
  flash = new ArrayList <Flash>();
  flash.add(new Flash());
  bg1 = loadImage("background.png");
  bg2 = loadImage("backgroundnight.png"); 
  house = loadImage("house.png");
  lucida = loadFont("LucidaSans-Demi-48.vlw");
  textFont(lucida, 100);
}
void draw() {
  imageMode(CORNER);
  //background(bg1);
  bg1.resize(width, 0);
  bg2.resize(width, 0);
  image(sin(sinCount) > 0 ? bg1 : bg2, 0, 0);
  house.resize(height, 0);
  image(house, width - house.width, 0);
  float d = dist((width - house.width) + house.width / 2, house.height / 2, jaeger.pos.x, jaeger.pos.y);
  if (d > 100) {
    jaeger.show();
    jaeger.edges();
    jaeger.hitTheReh(reh);
  }
  reh.show();
  float distJaegerBlitz = 0;
  for (Flash f : flash) {
    f.show();
    f.update();
    distJaegerBlitz = PVector.dist(jaeger.pos, f.pos);
    if (distJaegerBlitz < jaeger.left.width / 2) {
      toteRehZahler = 0;
      jaeger = new Jaeger();
    }
  }
  fill(255);
  text(toteRehZahler, 200, 200);
  if (reh.life <= 0) {
    reh = new Reh (random(300, width - 300), random(300, height - 300));
    toteRehZahler++;
  }


  sinCount += 0.01;
  if (flash.size() < 5)if (frameCount % 240 == 0)flash.add(new Flash());
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)jaeger.move("up");
    if (keyCode == DOWN)jaeger.move("down");
    if (keyCode == RIGHT)jaeger.move("right");
    if (keyCode == LEFT)jaeger.move("left");
  }
  if (key == ' '){
    jaeger.shoot();
    waffe = minim.loadFile("waffe.mp3");
    waffe.play();
  }
}