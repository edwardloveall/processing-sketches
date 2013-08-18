Character blot;
boolean _up, _down, _left, _right;

void setup() {
  size(500, 500);
  smooth();

  blot = new Character(new PVector(width/2, height/2), new PVector(0, 0));

  background(255);
}

void draw() {
  background(255, 1);
  if(keyPressed) {
    if (keyCode == UP){ _up = true; }
    if (keyCode == DOWN){_down = true; }
    if (keyCode == LEFT){_left = true; }
    if (keyCode == RIGHT){_right = true; }
  }
  if (_up == true) {moveBlot(UP);}
  if (_down == true) {moveBlot(DOWN);}
  if (_left == true) {moveBlot(LEFT);}
  if (_right == true) {moveBlot(RIGHT);}

  blot.update();
  blot.draw();
}

void moveBlot(int aKey) {
  int amount = 1;
  switch(aKey) {
    case UP:
      blot.vel.y -= amount;
      break;
    case DOWN:
      blot.vel.y += amount;
      break;
    case RIGHT:
      blot.vel.x += amount;
      break;
    case LEFT:
      blot.vel.x -= amount;
      break;
    default:
      break;
  }
}

void keyReleased() {
  if (keyCode == UP) {_up = false;}
  if (keyCode == DOWN) {_down = false;}
  if (keyCode == LEFT) {_left = false;}
  if (keyCode == RIGHT) {_right = false;}
}
