int speed = 0;
int csize = 400;
int change = 0;
float i = 0;
float add = 100;

void setup() {
  size(500, 500);
  smooth();
  frameRate = 30;
}

void draw() {
  background(0);
  ellipse(width/2, height/2, i, i);
  if (i+add < csize) {
    i++;
    i = i + add/2;
  }
}