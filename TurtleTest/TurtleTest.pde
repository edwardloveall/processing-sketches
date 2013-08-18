import terrapin.*;
Terrapin t;
int angle;

void setup() {
  size(800,800);
  background(0);
  smooth();
  colorMode(HSB, 360, 100, 100);
  
  t = new Terrapin(this);
  t.setLocation(width/2, height/4);
}

void draw() {
  t.setPenColor(frameCount % 360, 100, 50);
  t.forward(13);
  /*println();*/
  angle += round(sin((float)frameCount/30));
  println(angle);
  t.right(angle);
}