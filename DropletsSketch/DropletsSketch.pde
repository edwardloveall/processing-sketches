float ypos;
boolean record;
long seed;

void setup() {
  size(300, 200);
  background(16);
  smooth();
  fill(255);
  noStroke();
  ypos = height / 2;
  noLoop();
}

void draw(long _seed) {
  randomSeed(_seed);

  if (record) {
    beginRaw(PDF, "output.pdf");
  }

  /*for (int i = 0; i < 30; i++) {*/
    float dropSize = random(20, 50);
    float x = random(0+dropSize, width-dropSize);
    ellipse(x, ypos, dropSize, dropSize);

    println(dropSize + " :: " + x + " :: " + ypos);
  /*}*/

  if (record) {
    endRaw();
    record = false;
  }

}

void mousePressed() {
  seed = int(random(50000)); // generate new seed
  draw(seed);
}

void keyPressed() {
  if (key == 'r') {
    record = true;
    draw(seed); // use current seed
  }
}
