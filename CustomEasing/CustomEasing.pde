import static java.lang.Math.*;

void setup() {
  smooth();
  size(700, 400);
  background(255);
  fill(0);
  noStroke();
  frameRate(30);
}

void draw() {
  background(255);

  ellipse(easeOutStrong(30, 90)*(width-30)+30, height/2, 30, 30);
}

float easeOutStrong(int start, int end) {
  float length = end - start;
  float stepSize = 1/length;
  float time = (frameCount-start)/stepSize;
  return (time >= 1) ? 1 : 1 - Math.pow(2, -10 * time);
}
