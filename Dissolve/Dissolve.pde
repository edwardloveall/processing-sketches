void setup() {
  size (500, 500);
  background(255);
  frameRate(2);
  stroke(50, 100, 200);
}

void draw() {
  int s = 0;
  background(255);
  for(int y = 0; y < height; y++) {
    for(int i = 0; i < width; i++) {
      int test = int(random(0, width));
      if (test > i && test < width) {
          point(i, y);
      }
    }
  }
}
