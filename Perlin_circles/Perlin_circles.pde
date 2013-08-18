float tSize = 10;
float tHue = random(0, 255);
float stepVal = 0.01;
float fifthHeight;
float bgBaseBrit = 50;
float britSeed = random(0, 100);

void setup() {
  size(700, 400);
  noStroke();
  colorMode(HSB);
  noiseDetail(1);
  smooth();
  
  fifthHeight = height/5;
}

void draw() {
  background(0);
  
  float britShift = noise(britSeed);
  britSeed += 0.005;
  
  int j = 0;
  for(int i = 0; i < height; i += fifthHeight, j++) {
    fill(0, 0, bgBaseBrit - (j * 20) + britShift * 200);
    rect(0, i, width, i + fifthHeight);
  }
  
  for (int i = 0; i < 9; i++) {
    float circleSize = noise(tSize + stepVal * (i * 2));
    circleSize = map(circleSize, 0, 1, 10, 200);
    
    int x = i * (width/3) % (width - 1) + (width/6);
    int y = floor(i/3) * (height/3) % height + (height/6);
    
    float hue = tHue + i * stepVal;
    tHue += stepVal;
    
    fill(hue, 127, 200); 
    ellipse(x, y, circleSize, circleSize);
  }
  tSize += stepVal;
}
