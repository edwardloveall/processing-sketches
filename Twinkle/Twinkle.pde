interface Constants {
  public static final int GLOBAL = -1;
}

ParticleSystem ps;
int globalSquareWidth = 10;
int globalSquareHeight = 10;
float globalHue = 30;
/*float globalHue;*/

void setup() {
  size(701, 401);
  background(16);
  colorMode(HSB, 100);
  noStroke();
  
  ps = new ParticleSystem();
  for (int i = 0; i < (width-1)/globalSquareWidth; i++) { // x
    for (int j = 0; j < (height-1)/globalSquareHeight; j++) { // y
      PVector location = new PVector(i*globalSquareWidth, j*globalSquareHeight);
      ps.add(location, globalHue);
    } // for j
  } // for i
} // setup

void draw() {
  /*globalHue = ((float)mouseX/width)*100;*/
  ps.update();
} // draw