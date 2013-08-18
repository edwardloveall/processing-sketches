float startPoint = TWO_PI*random(1);

void setup() {
  background(17, 17, 25);
  size(700, 400);
  smooth();
}

void draw() {
  background(17, 17, 25);
  int diameter = mouseX;
  float angle = (float)(height-mouseY)/height*TWO_PI;
  
  fill(244, 250, 186);
  noStroke();
  ellipse(350, 200, diameter, diameter);
  stroke(244, 250, 186);
  noFill();
  //ellipse(350, 200, diameter*1.1, diameter*1.1);
  arc(350, 200, diameter*1.1, diameter*1.1, startPoint, startPoint+angle);
}
