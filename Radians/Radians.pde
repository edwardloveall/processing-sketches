float x = 0.0;
int tics = 12;
int col = 0;

void setup() {
  colorMode(HSB, 255);
  size(400, 400);
  smooth();
  strokeWeight(5);
  frameRate(30);
  background(0);
}

void draw() {
  background(0, 10);
  float x = sin(radians(mouseX*(360/tics)))*100;
  float y = cos(radians(mouseX*(360/tics)))*100;
  stroke(col%360, 255, 255);
  point(x+200, y+200);
}

void mouseMoved() {
  col++;
}

