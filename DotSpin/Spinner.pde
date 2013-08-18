class Spinner {
  PVector[] dots;
  PVector loc;
  float r;
  float vel;
  float angle;
  float sectionLength;

  Spinner(int _dotCount, float _r, float _vel) {
    r = _r;
    vel = _vel;
    angle = random(0, TWO_PI);
    dots = new PVector[_dotCount];
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new PVector(0,0);
    }
    loc = new PVector(width/2, height/2);

    sectionLength = TWO_PI / dots.length;
  }

  void update() {
    angle += vel;

    for (int i = 0; i < dots.length; i++) {
      dots[i].x = r * sin(angle + sectionLength * i) + loc.x;
      dots[i].y = r * cos(angle + sectionLength * i) + loc.y;
    }
  }

  void display() {
    for(PVector d: dots) {
      ellipse(d.x, d.y, 2, 2);
    }
  }
}
