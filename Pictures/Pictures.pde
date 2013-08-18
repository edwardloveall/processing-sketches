PImage pic;

void setup() {
  background(255);
  pic = loadImage("heart.jpg");
  noFill();
  size(400, 400);
  smooth();
  strokeWeight(3);
}

void draw() {
  color pixel = pic.get(mouseX, mouseY);
  stroke(pixel);
  point(mouseX, mouseY);
  int x = int(random(width));
  int y = int(random(height));
  pixel = pic.get(mouseX, mouseY);
  point(x, y);
  
}
