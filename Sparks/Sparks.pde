import traer.physics.*; //http://www.cs.princeton.edu/~traer/physics/

ParticleSystem sparks;
Attraction orgin;
Particle[] spark;
Particle mouse;

void setup() {
  background(0);
  size(400, 400);
  noStroke();
  smooth();
  frameRate(30);
  ellipseMode(CENTER);
  
  sparks = new ParticleSystem(0.0, 0.1);
  
  mouse = sparks.makeParticle(100.0, mouseX, mouseY, 0);

  orgin = sparks.makeAttraction(mouse, spark, -20.0, 20.0);
}

void draw() {
  
}
