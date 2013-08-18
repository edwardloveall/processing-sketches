import oscP5.*;
OscP5 oscP5;

ParticleSystem ps;
ArrayList<PVector> forces;
boolean applyForces;
final int MONOME_WIDTH = 8;
final int MONOME_HEIGHT = 8;

void setup() {
  size(500, 500);
  smooth();
  background(16);
  /*noStroke();*/
  noFill();
  strokeWeight(1);
  
  ps = new ParticleSystem();
  forces = new ArrayList();
  forces.add(new PVector(random(-1, 1), 0));
  applyForces = false;
  
  oscP5 = new OscP5(this, 8000);
}

void draw() {
  background(16, 50);
  ps.run();
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/box/press")) {
    if (msg.get(2).intValue() == 1) {
      float xUnit = width/MONOME_WIDTH + 1;
      float yUnit = height/MONOME_HEIGHT + 1;

      float xCoord = msg.get(0).intValue() * xUnit + xUnit;
      float yCoord = msg.get(1).intValue() * yUnit + yUnit;
      
      ps.explode(new PVector((float)xCoord, (float)yCoord), 1);
    }
  }
}
