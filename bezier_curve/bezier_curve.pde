void setup() {
  size(700, 400);

}

void draw() {
  background(255);
  float s = 3;

  PVector anchorOne = new PVector(40, height/2);
  PVector anchorTwo = new PVector(width - 40, height/2);
  PVector controlOne = new PVector(mouseX, mouseY);
  PVector controlTwo = new PVector(width - mouseX, height - mouseY);

  if (mousePressed) {
    ellipse(anchorOne.x, anchorOne.y, s, s);
    ellipse(anchorTwo.x, anchorTwo.y, s, s);
    ellipse(controlTwo.x, controlTwo.y, s, s);

    line(anchorOne.x, anchorOne.y, controlOne.x, controlOne.y);
    line(anchorTwo.x, anchorTwo.y, controlTwo.x, controlTwo.y);
  }

  beginShape();
    vertex(anchorOne.x, anchorOne.y);
    bezierVertex(controlOne.x, controlOne.y, controlTwo.x, controlTwo.y, anchorTwo.x, anchorTwo.y);
  endShape();
}
