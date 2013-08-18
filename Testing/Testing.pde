// Point Generator by Edward Loveall

void setup() {
  size(300, 300);
  background(0);
  frameRate(0.5);
}


void draw() {
  fill(color);
  rect(50, 50, 100, 100);
  PFont font;
  font = loadFont("Courier-11.vlw");  //  Load the font 
  textFont(font);
  fill(255);
  text(r*127, 10, 10);
  text(g*127, 110, 10);
  text(b*127, 210, 10);
  //  rect(x, y, 2, 2);
  //  smooth();
  //  line(mouseX, mouseY, x, y);
}
