int[] x = new int[25];

void setup() {
  size(650, 175);
  fill(109, 144, 166);
  noStroke();
  noSmooth();
  noLoop();
}

void draw() {
  background(255); // draw background so that old shredder gets covered
  // set number of pixels per column
  for (int i = x.length-1; i >= 0; i--) {
    x[i] = round(random(1, 6));
  }
  
  // iteration x[] draws from left -> right
  for (int ix = 0; ix <= x.length-1; ix++) {
    // draw pixels per column
    for (int iy = 0; iy <= x[ix]; iy++) {
      rect((ix*25)+20, height-(iy*25), 5, 5);
    }
  }
}

void mousePressed() {
  redraw();
}
