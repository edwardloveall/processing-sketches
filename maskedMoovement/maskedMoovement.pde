PImage niceImage;
PImage maskImage;
PGraphics graphicalMask;

void setup() {
  size(200, 200);
  niceImage = loadImage("rainbow.jpg");
  maskImage = loadImage("mask.jpg");
  graphicalMask = createGraphics(width, height, JAVA2D);
}

void draw() {
  background(0);
  graphicalMask.beginDraw();
  graphicalMask.background(0);
  graphicalMask.smooth();
  graphicalMask.fill(255);
  graphicalMask.noStroke();
//  graphicalMask.ellipse(width-mouseX, height-mouseY, 100, 100);
  graphicalMask.image(maskImage, width/2-mouseX, height/2-mouseY, 200, 200);
  graphicalMask.endDraw();

  niceImage.mask(graphicalMask);
  image(niceImage, mouseX-height/2, mouseY-height/2);
}
