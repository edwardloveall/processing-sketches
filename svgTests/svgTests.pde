import prosvg.*;
PShape circle;

void setup() {
  circle = loadShape("circle.svg");
  /*shapeMode(CENTER);*/
  smooth();
  size(700, 400);
  background(16);
}

void draw() {
  background(16);
  
  circle.translate(mouseX, mouseY);
  circle.rotate(radians(1));
  circle.translate(-circle.width / 2, -circle.height / 2);
  shape(circle, 200, 200);
}