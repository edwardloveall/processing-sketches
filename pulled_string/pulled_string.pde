int cx1, cx2, cy1, cy2;

void setup() {
  size(400, 400);
  stroke(255);
  strokeWeight(3);
  smooth();
  noFill();
}

void draw() {
  background(0);
  cx1 = int(random((width*.75), width));
  cx2 = int(random((width*.25), 0));
  cy1 = int(random((height*.25), 0));
  cy2 = int(random((height*.75), height));
  bezier(0, height, cx1, cy1, cx2, cy2, width, 0);
//  point(cx1, cy1);
//  point(cx2, cy2);
  line(cx1, cy1, width, 0);
  line(cx2, cy2, 0, height);
}
