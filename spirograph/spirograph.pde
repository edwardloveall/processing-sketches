float tightness = 0.1; // smaller = tighter curls
float size = 30;
float difference = 1.9; // 0 - 2

float innerAngleDelta = radians(1 / tightness);
float outerAngleDelta = radians((-1 / tightness) * difference);
float innerAngle = 0f;
float outerAngle = 0f;
float innerDistance = size * tightness;
float outerDistance = size;
PVector point;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  strokeWeight(1);
  point = new PVector(width / 2, height / 2);
}

void draw() {
  float hue = frameCount % 360;
  stroke(hue, 100, 80);

  float innerX = innerDistance * cos(innerAngle);
  float innerY = innerDistance * sin(innerAngle);
  float outerX = outerDistance * cos(outerAngle);
  float outerY = outerDistance * sin(outerAngle);

  PVector oldPoint = new PVector(point.x, point.y);
  point.add(innerX, innerY, 0);
  point.add(outerX, outerY, 0);
  innerAngle += innerAngleDelta;
  outerAngle += outerAngleDelta;

  line(oldPoint.x, oldPoint.y, point.x, point.y);
}
