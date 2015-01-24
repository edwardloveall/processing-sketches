float halfHeight, halfWidth;

void setup() {
  size(800, 600);
  noFill();
  halfHeight = height / 2;
  halfWidth = width / 2;
}

void draw() {
  background(255);
  translate(0, halfHeight);
  float y = sin(frameCount / 30f) * 100;

  beginShape();
    vertex(0, 0);
    quadraticVertex(100, y * -0.5, 200, 0);
//    vertex(200, halfHeight);
    quadraticVertex(halfWidth, y, 600, 0);
    quadraticVertex(700, y * -0.5, 800, 0);
  endShape();
}
