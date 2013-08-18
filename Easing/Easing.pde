import penner.easing.*;

float x = 200;
float y = 200;

void setup() {
  size (400, 400);
  background(0);
  smooth();
  stroke(255, 50);
  strokeWeight(2);
  fill(255, 25);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
  }
  ellipse(Elastic.easeOut (0, 1, x, 100), y = Elastic.easeOut (0, 1, y, 100), 20, 20);
}