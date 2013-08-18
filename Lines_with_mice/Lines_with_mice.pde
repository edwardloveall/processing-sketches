int white = 255;
int black = 0;

void setup() {
  size(700, 500);
}

void draw() {
  background(black);
  stroke(white);
  strokeWeight(5);
  smooth();
  float x = mouseX;
  float y = mouseY;
  line(x, y, width-x, height-y);
}
