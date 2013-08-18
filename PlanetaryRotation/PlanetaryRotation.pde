Planet earth;
Orbiter moon, littleMoon;
float fps = 30;

void setup() {
  size(700, 400, P3D);
  ortho(0, width, 0, height);
  noStroke();
  fill(0);
  smooth(8);
  frameRate(60);
  
  lights();
  
  PVector center = new PVector(width * 0.5, height * 0.5, 0);
  earth = new Planet(center, 80);
  moon = new Orbiter(earth, 20, 30, 0.2);
  littleMoon = new Orbiter(moon, 10, 5, -0.57);
}

void draw() {
  background(0);
  
  earth.display();
  moon.update();
  littleMoon.update();

  moon.display();
  littleMoon.display();
}