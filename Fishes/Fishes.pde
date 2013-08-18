Particle p;

void setup() {
  size(400, 400);
  background(16);
  smooth();
  p = new Particle(new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0), 5000f, 10f);
}

void draw() {
  background(16);
  if(mousePressed && (mouseButton == LEFT)) {
    float direction = (float)mouseX/width-0.5;
    PVector wind = new PVector(direction, 0);
    p.applyForce(wind);
  }
  p.update();
  p.draw();
}
