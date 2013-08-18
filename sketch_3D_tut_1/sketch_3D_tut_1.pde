float z;

void setup() {
  size(700, 400, P3D);
//  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(mouseX, mouseY, z);
  rotateX(mouseY/50f);
  rotateY(mouseX/50f);
  rect(0, 0, 50, 50);

  z = sin(frameCount / 20f) * 50f;
}

