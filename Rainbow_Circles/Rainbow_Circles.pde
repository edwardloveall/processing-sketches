float halfWidth;
final int numCircles = 7;
ArrayList circleArray;
Circle[] circles;

void setup() {
  size(700, 400);
  colorMode(HSB);
  smooth();
  fill(255);
  noStroke();
  halfWidth = width/2;
  
  circles = new Circle[numCircles];
  
  float hueSpacing = 360 / (numCircles + 2);
  
  for(int i = 0; i < numCircles; i++) {
    float reach = i / ((float)numCircles - 1);
    reach *= 2;
    reach -= 1;
    circles[i] = new Circle(hueSpacing * i, reach);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < numCircles; i++) {
    circles[i].update();
    circles[i].draw();
  }
}
