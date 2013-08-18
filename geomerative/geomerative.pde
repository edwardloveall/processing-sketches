import geomerative.*;

RPath shp1;
RPoint start;

float i = 0;
float cp = 20;

int oldX;
int oldY;

int cpx1, cpx2, cpy1, cpy2, distX, distY;

void setup() {
  size (400, 400);
  smooth();
  background(0);
  
  RG.init(this);
  
  oldX = width/4;
  oldY = height/2;
  
  start = new RPoint(oldX, oldY);
  shp1 = new RPath(start);
  //shp1.addLineTo(width*.75, height/2);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(3);
  noFill();
  translate(i, 0);
  shp1.draw();
  i -= 1;
}

void mousePressed() {
  //shp1.addQuadTo(mouseX+cp, mouseY+cp, mouseX-i, mouseY);
  //shp1.addQuadTo(oldX-i, mouseY, mouseX-i, mouseY);
  distX = mouseX - oldX;
  distY = mouseY - oldY;
  cpx1 = oldX + (int)(distX * .25) - (int)i;
  cpy1 = oldY;
  cpx2 = oldX - (int)(distX * .25) - (int)i;
  cpy2 = mouseY;
  shp1.addBezierTo(cpx1, cpy1, cpx2, cpy2, mouseX - (int)i, mouseY);
  oldX = mouseX;
  oldY = mouseY;
}
