void setup() {
  background(17, 17, 25);
  size(700, 400);
  smooth();
  fill(244, 250, 186);
  noStroke();
}

void draw() {
  background(17, 17, 25);

  int display = (int)random(0, 10*((float)(width-mouseX)/width));

  if(display == 0) {
    for(int i = 0; i < 30; i++) {
      int posX = (int)random(0, width);
      int posY = (int)random(0, height);
      int diameter = (int)random(18, height/9);

      ellipse(posX, posY, diameter, diameter);
    }
  }
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
