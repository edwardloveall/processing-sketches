void setup() {
  size(700, 500);
}

void draw() {
  background(0);
  stroke(127, 255, 0);
  strokeWeight(0);
  smooth();
  fill(127, 255, 0);
  float mx = mouseX/30.;
  float my = mouseY/90.;
  arc(width/2, height/2, 100, 100, mx, PI/5+mx);
  arc(width/2, height/2, 100, 100, mx+PI, PI/5+mx+PI);
  arc(width/2, height/5, 100, 100, 0+PI/2+my, 0+PI/2-my);
}
