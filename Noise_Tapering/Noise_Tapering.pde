void setup() {
  size(30, 30);
  noSmooth();
  stroke(0);
}

void draw() {
  background(255);
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      float coin = random(0, height);
      if (coin > j) {
        point(i, j);
      }
    }
  }
  
  noLoop();
}
