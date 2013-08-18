ParticleSystem ps;

void setup() {
  size(700, 400);
  noStroke();
  
  ps = new ParticleSystem();
  
  for(int i = 0; i < 10; i++) {
    ps.add();
  }
  
  background(0);
}

void draw() {
//  ps.add();
//  background(0);
  ps.draw();
}
