Spinner[] spinners;

void setup() {
  size(700, 400);
  smooth();
  fill(33);
  noStroke();

  spinners = new Spinner[40];

  for (int i = 0; i < spinners.length; i++) {
    int count = 6 + i * 2;
    float r = i * 8 + 8;
    float vel = spinners.length / (i + 1) * 0.001;

    spinners[i] = new Spinner(count, r, vel);
  }
}

void draw() {
  background(255);

  for(Spinner s: spinners) {
    s.update();
    s.display();
  }
}
