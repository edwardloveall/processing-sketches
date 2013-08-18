ParticleSystem ps;
color globalColor = color(255, 255, 0); // yellow
Boolean debug = true;

PImage houseBG;

void setup() {
  size(1024, 768);
  smooth();
  frameRate(30);
  noStroke();
  fill(255, 255, 0);
  background(0);
  houseBG = loadImage("house.jpg");

  ps = new ParticleSystem();
  quickCreateParticles(1);

  ellipse(width/2, height/2, 20, 20);
}

void draw() {
  /*background(0);*/
  image(houseBG, 0, 0);
  ps.update();
}

void mousePressed() {
  /*quickCreateParticles(1);*/
}

void keyPressed() {
  if (key == 32) {
    debug = !debug;
  } else if (key == 49) {
    quickCreateParticles(30);
  }

  if (debug) {
    ps.debug();
  }
}

void quickCreateParticles(int count) {
  for (int i = 0; i < count; i++) {
    PVector location = new PVector(random(0, width-15), random(0, height-15));
    /*float life = random(30, 32);*/
    float life = 20;
    Firefly f = new Firefly(location, life);
    ps.add(f);
  }
}
