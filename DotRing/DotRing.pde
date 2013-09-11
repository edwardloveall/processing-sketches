Spinner s;
Spinner r;

void setup() {
  size(800, 600);
  smooth();
  frameRate(25);

  s = new Spinner(5, 160, radians(1), #258CDD, 255);
  r = new Spinner(3, 100, radians(-1), 255, #258CDD);
}

void draw() {
  background(#221E1F);

  s.update();
  s.display();

  r.update();
  r.display();

  // saveFrame("frames/frame-###.png");
}
