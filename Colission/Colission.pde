void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  int x = round(random(width));
  int y = round(random(height));
  ellipse(x, y, 20, 20);
  println(x);
}
