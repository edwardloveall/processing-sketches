void setup() {
  size(700, 500);
}

void draw() {
  background(0);
  float x = width;
  float y = height;
  stroke(255, 0, 0);
  strokeWeight(3);
  smooth();
  for (float xx = 0.; xx <  1.1; xx += 0.1) {
    stroke(random(255), random(255), random(255));
    line(mouseX*xx, 0, mouseX*xx, y);
  }
}
