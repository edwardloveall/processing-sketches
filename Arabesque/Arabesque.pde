color[] colors = {color(255, 0, 0), color(255, 165, 0), color(255, 255, 0), color(0, 128, 0), color(0, 0, 255), color(75, 0, 130), color(238, 130, 238)};
int c;
float blurAmount, ellipseSize;

void setup() {
  size(720, 480);
  smooth();
  stroke(255);
  strokeWeight(3);
  ellipseMode(CENTER);
  //noLoop();
}

void draw() {
  blurAmount = float(mouseY)/200;
  ellipseSize = height-mouseY;
  background(0, 50);
  c = int(random(7));
  c = 1;
  fill(colors[c], 45);
  stroke(colors[c]);
  ellipse(width/2, height/2, ellipseSize, ellipseSize);
  filter(BLUR, blurAmount);
}
