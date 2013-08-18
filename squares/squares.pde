int squareSize = 10;
int spacer = (int)squareSize/4;
int longitudinalNumber = 60; // width
int lateralNumber = 30; // height
int c1, c2, c3;

void setup() {
  size((squareSize+spacer)*longitudinalNumber+spacer, (squareSize+spacer)*lateralNumber+spacer);
  background(0);
  noStroke();
  noSmooth();
  noLoop();
}

void draw() {
  for(int i = spacer; i < width; i += squareSize+spacer) {
    for(int j = spacer; j < height; j += squareSize+spacer) {
      c1 = (int)random(0, 255);
      c2 = (int)random(0, 255);
      c3 = (int)random(0, 255);

      fill(c1, c2, c3); // full color
      //fill(c1, c1, c1); // black & white
      rect(i, j, squareSize, squareSize);
    }
  }
}

void mousePressed() {
  redraw();
}

