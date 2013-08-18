float noiseScale = 0.005f;
float lineCount = 50;
float lineSpace;

void setup() {
  size(700, 400);
//  smooth();
  stroke(255, 0.1);
  rectMode(CENTER);
  
  lineSpace = width/lineCount;
}

void draw() { 
  background(0);
  for (int i = 0; i < lineCount; i++) {
    float noiseVal = noise((frameCount + i)*noiseScale);
//    line(i * lineSpace, noiseVal * -150 + (height / 2), i * lineSpace, noiseVal * 150 + (height / 2));
    rect(i * lineSpace + 5, height / 2, 5, noiseVal * 150);
  }
}
