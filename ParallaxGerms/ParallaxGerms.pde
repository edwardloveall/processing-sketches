ParticleSystem ps;
float testAverage = 0;

void setup() {
  size(700, 400);
  background(0);
  smooth();
  /*fill(255);*/
  noStroke();
  ps = new ParticleSystem();
}

void draw() {
  background(0);
  if (random(0, 20) > 19) { // 1 in 20 chance
    /*ps.add(new PVector(width, random(0, height)), random(3, 20));*/
    float size = random(3, 20);
    PVector location = new PVector(width+size, random(0, height));
    float shade = random(16, 255);
    Particle p = new Particle(location, size, shade);
    ps.add(p);
  }
  ps.update();
}

void name() {
  
}
