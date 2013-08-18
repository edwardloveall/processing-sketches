class Spinner {
  PVector[] dots;
  PVector loc;
  float r;
  float vel;
  float angle;
  float sectionLength;
  float dotSize;
  color dotColor;
  color ringColor;

  Spinner(int _dotCount, float _r, float _vel, color _dotColor, color _ringColor) {
    r = _r;
    vel = _vel;
    angle = random(0, TWO_PI);
    dots = new PVector[_dotCount];
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new PVector(0,0);
    }
    loc = new PVector(width/2, height/2);

    sectionLength = TWO_PI / dots.length;
    dotSize = 28;
    dotColor = _dotColor;
    ringColor = _ringColor;
  }

  void update() {
    angle += vel;

    for (int i = 0; i < dots.length; i++) {
      dots[i].x = r * sin(angle + sectionLength * i) + loc.x;
      dots[i].y = r * cos(angle + sectionLength * i) + loc.y;
    }
  }

  void display() {
    stroke(ringColor);
    strokeWeight(4);
    noFill();
    ellipse(loc.x, loc.y, r*2, r*2);

    strokeWeight(8);
    stroke(#221E1F);
    fill(dotColor);

    for (int i = 0; i < dots.length; i++) {
      // fill(i == 0 ? #E42D2B : 255);
      ellipse(dots[i].x, dots[i].y, dotSize, dotSize);
    }
  }
}
