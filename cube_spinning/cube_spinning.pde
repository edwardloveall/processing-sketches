import processing.opengl.*;

int swidth = 50;
int sheight = 50;
int sdepth = 50;

void setup() {
  size (300, 300, OPENGL);
  background(255);
  smooth();
}

void draw() {
  background(255);
  //directionalLight(255, 255, 255, width*(2/3), height*(2/3), 1);
  directionalLight(255, 255, 255, 0, 0, 0);
  //translate(mouseX, mouseY, 0);
  translate(width/2, height/2, 0);
  rotateY(radians(45));
  rotateX(radians(45));
  //rotateY(radians(mouseX));
  //rotateX(radians(mouseY));
  fill(255, 0, 0);
  box(30);
}
