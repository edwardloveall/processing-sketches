Flock f;
float hWidth;
float hHeight;
float fifthHeight;
float bgBaseHue = 120;
float bgBaseBrit = 127;
float hueSeed = random(0, 100);

void setup() {
  size(700, 400);
  strokeWeight(1);
  colorMode(HSB);

  hWidth = width/2;
  hHeight = height/2;
  fifthHeight = height/5;

  f = new Flock(200);
}

void draw() {
  background(0);
  noStroke();

  float hueShift = noise(hueSeed);
  hueSeed += 0.001;

  for(int i = 0; i < 4; i++) {
    fill(bgBaseHue + hueShift * 40, 255, bgBaseBrit + (i * 10));
    rect(0, i * fifthHeight, width, fifthHeight);
  }

  fill(35, 59, 230);
  rect(0, 4 * fifthHeight, width, height);
  f.update();
}
