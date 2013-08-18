float scaleFactor, xOff, yOff;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  rectMode(CENTER);
  
  scaleFactor = 1;
  xOff = 0;
  yOff = 0;
}

void draw() {
  background(255);
  
  pushMatrix();
    translate(xOff, yOff);
    scale(scaleFactor);
    
    float size = sin(frameCount / 10f);
    float f = map(size, -1, 1, 30, 80);
    
    fill(#FF5133);
    ellipse(50, 200, f, f);
    fill(#CACA74);
    ellipse(400, 70, f * 2, f * 2);
    
    pushMatrix();
    translate(mouseX, mouseY);
      rotate(size);
      fill(#4EC80C);
      rect(0, 0, 60, 20);
    popMatrix();
    
  popMatrix();
}

void mouseMoved() {
  xOff = mouseX;
  yOff = mouseY;
}

void mouseDragged() {
  scaleFactor += (mouseX - pmouseX) / 100f;
  scaleFactor = max(0, scaleFactor);
}