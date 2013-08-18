Orbiter orbiters[] = new Orbiter[100];

void setup() {
  size(700, 400, P3D);
  colorMode(HSB, 1);
  smooth(4);
  noStroke();
  frameRate(30);

  // ortho(0, width, 0, height);
  lights();
  
  for (int i = 0; i < orbiters.length; i++) {
    orbiters[i] = new Orbiter(140);
  }
}

void draw() {
  background(0, 0, 1);
  
  translate(width * 0.5, height * 0.5);
  
  fill(0, 0, 0.2);
  sphere(80);
  
  for(Orbiter o: orbiters) {
    o.update();
    o.display();
  }
}