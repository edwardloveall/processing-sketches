import processing.pdf.*;

void setup() {
  size(800, 600, PDF, "out.pdf");
  background(16);
  smooth();
  fill(255);
  noStroke();
}

void draw() {
  for (int i = 0; i < 100; i++){
    float p = random(1);
    float starSize = 10*pow(2, 10 * (p - 1)) + 1;
    /*float starSize = random(1, 10);*/
    ellipse(random(0+starSize, width-starSize), random(0+starSize, height-starSize), starSize, starSize);
  }
  exit();
  noLoop();
}