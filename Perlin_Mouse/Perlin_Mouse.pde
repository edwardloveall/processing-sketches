float xOff1, yOff1, xOff2, yOff2;
float noiseInc = 0.01;
float xNoiseScale, yNoiseScale;

void setup() {
  size(500, 500);
  background(255);

  xOff1 = random(0, 1000);
  yOff1 = random(1000, 2000);
  xOff2 = random(2000, 3000);
  yOff2 = random(3000, 4000);

  xNoiseScale = width;
  yNoiseScale = height;

  noiseSeed(millis() + minute() + day());
  noiseDetail(1);

  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  stroke(frameCount / 10, 100, 50, 10);

  PVector point1 = new PVector(noise(xOff1), noise(yOff1));
  PVector point2 = new PVector(noise(xOff2), noise(yOff2));

  point1.mult(width);
  point2.mult(width);

  println(noise(xOff1));

  line(point1.x, point1.y, point2.x, point2.y);
  xOff1 += noiseInc;
  yOff1 += noiseInc;
  xOff2 += noiseInc;
  yOff2 += noiseInc;
}
