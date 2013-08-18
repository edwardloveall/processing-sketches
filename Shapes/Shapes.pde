int count = 0, X = 20;
float v1X = X;
float v1Y;
float v2X, v2Y;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
  strokeWeight(2);
  smooth();
  noFill();
  frameRate(24);
  background(0);
  v1Y = height/2.0;
  print(v1Y);
}

void draw() {
  if(count%24 == 0) {
    v2X = X+40;
    v2Y = random(20, height - 20);
    float distance = v2X-v1X;
    float twoThirds = distance*(2.0/3.0);
    float c1X = v1X+twoThirds, c1Y = v1Y;
    float c2X = v2X-twoThirds, c2Y = v2Y;
    beginShape();
    vertex(v1X, v1Y);
    bezierVertex(c1X, c1Y, c2X, c2Y, v2X, v2Y);
    endShape();
    X += 40;
    v1X = v2X; v1Y = v2Y;
  }
  count++;
}
