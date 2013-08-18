ParticleSystem ps;
ArrayList<PVector> forces;
boolean applyForces;

void setup() {
  size(700, 400);
  smooth();
  background(16);
  /*noStroke();*/
  noFill();
  strokeWeight(1);
  
  ps = new ParticleSystem();
  forces = new ArrayList();
  forces.add(new PVector(random(-1, 1), 0));
  applyForces = false;
}

void draw() {
  background(16, 50);
  
  PVector location = new PVector((float)mouseX, (float)mouseY);
  PVector velocity = new PVector(random(-1, 1), random(-1, 1));
  float life = random(0, 0.7);
  
  ps.add(location, velocity, life);
  ps.run();
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    /*wind = new PVector(random(-1, 1), 0);*/
  } else if (mouseButton == LEFT) {
    ps.applyForces();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    ps.removeForces();
  }
}

void keyPressed() {
  if (keyCode == 32) {
    ps.explode(20);
  }
}