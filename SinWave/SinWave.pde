float x = 0.0;

void setup() {
  size(400, 400);
  smooth();
  strokeWeight(2);
  frameRate(30);
}

void draw() {
  float x = radians(mouseX/40.0)*40;
  point(mouseX, x+200);
}

