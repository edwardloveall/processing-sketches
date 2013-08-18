void setup() {
  size(700, 400);
  stroke(0);
  noFill();
  background(255);
}

void draw() {
  
  if (mousePressed) {
    float life = 2;
    PVector pos = new PVector(mouseX, mouseY);
    spark(life, pos);
  }
  
}

void spark(float life, PVector pos) {
  if (life > 0.1) {
    stroke(map(life, 2, 0, 0, 255));
    point(pos.x, pos.y);
    life -= 0.01;
    pos.x += random(-1, 1);
    pos.y += random(-1, 1);
    spark(life, pos);
  }
}