float off  = random(1000);
float step = random(0.01, 0.02);

void setup() {
  size(700, 400);
  noFill();
  stroke(255);
  noiseDetail(2);
}

void draw() {
  background(0);
  off -= step;

  for (int i = 0; i < width; i++) {
    float y = noise(off + i * 0.02, off - 0.001 * 0.02);
    point(i, y * 50 + 100);
  }
}
