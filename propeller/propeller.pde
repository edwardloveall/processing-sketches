int rect_width = 10;
int rect_height = 70;

void setup() {
  size(400, 400);
  background(0);
  fill(255);
  stroke(255, 0, 0);
  smooth();
}

void draw() {
  background(0, 26);
  translate(width/2, height/2);
  rotate(radians(mouseX*2));
  rect(-rect_width/2, -rect_height/2, rect_width, rect_height);
}
