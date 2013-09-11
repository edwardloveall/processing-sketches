int deep = 0;

void setup() {
  size(800, 600);
}

void draw() {
  // recurseTri(20, height/2, 40);
  noLoop();
}

void recurseTri(float x, float y, int size) {
  triangle(x, y, x-size, y+size, x+size, y+size);

  if (deep < 20) {
    recurseTri(x + size, y + size, size);
    recurseTri(x + size, y - size, size);
    deep++;
  }

  print(deep);
}