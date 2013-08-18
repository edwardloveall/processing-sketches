Point2D sketchCenter;
float angle;
int frame;

void setup() {
  size(700, 400);
  background(16);
  smooth();
  noFill();
  /*strokeWeight(15);*/
  stroke(255);
  sketchCenter = new Point2D(width/2, height/2);
  frame = 0;
}

void draw() {
  background(16, 0.4);
  float angle = radians(frame % 360);
  float radius = mouseX;
  float x = radius * cos(angle) + sketchCenter.x;
  float y = radius * sin(angle) + sketchCenter.y;
  
  /*println("x: " + x + sketchCenter.x + " y: " + y + sketchCenter.y);*/
  
  noFill();
  strokeWeight(15);
  stroke(255)
  ;
  ellipse(x, y, 80 + radius, 80 + radius);
  
  strokeWeight(2);
  
  arc(sketchCenter.x, sketchCenter.y, radius*2, radius*2, 0, angle);
  line(sketchCenter.x, sketchCenter.y, x, y);
  
  fill(255);
  noStroke();
  
  ellipse(x, y, 5, 5);
  
  frame++;
}

class Point2D {
  float x, y;
  
  Point2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
}