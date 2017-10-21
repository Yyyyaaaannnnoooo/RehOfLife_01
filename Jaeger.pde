class Jaeger {
  PImage left, right;
  PVector pos, speed, bullet;
  Jaeger() {
    left = loadImage("twohunters_Left.png");
    right = loadImage("twohunters_Right.png");
    pos = new PVector(left.width, left.height);
    speed = new PVector(5, 0);
  }

  void show() {
    imageMode(CENTER);
    image(direction(reh) == -1 ? left : right, pos.x, pos.y);
    if (bullet != null)ellipse(bullet.x, bullet.y, 50, 50);
  }

  void edges() {
    if (pos.x < 0)pos.x = 0;
    if (pos.x > width)pos.x = width;
    if (pos.y < 0)pos.y = 0;
    if (pos.y > height)pos.y = height;
  }

  void move(String direction) {
    if (direction == "up")pos.y -= 50;
    if (direction == "down")pos.y += 50;
    if (direction == "right")pos.x += 50;
    if (direction == "left")pos.x -= 50;
  }
  void hitTheReh(Reh target) {
    if (bullet != null) {
      bullet.x += 55 * direction(target);
      float d = PVector.dist(bullet, target.pos);
      if (d < target.img.width / 4) {
        muuu = minim.loadFile("reh.mp3");
        muuu.play();
        target.life--;
      }
    }
  }
  int direction(Reh r) {
    int dir = 0;
    if (pos.x > r.pos.x) {
      dir = -1;
    } else {
      dir = 1;
    }
    return dir;
  }
  void shoot() {
    bullet = new PVector(pos.x, pos.y);
  }
}