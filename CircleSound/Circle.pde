class Circle {
  float angle, aVel;
  float radius;
  float amp;
  float opacity, red, green, blue;
  PVector pos;

  Circle() {
    angle = random(0, TWO_PI);
    aVel = TWO_PI * random(0.0003, 0.0006);
    radius = random(50, 100);
    amp = 0;
    pos = new PVector(0, 0);
  }

  void update() {
    updatePosition();
    updateAppearance();
  }

  void updatePosition() {
    angle += aVel;

    if (amp > 0.001) {
      amp *= 0.9;
    } else {
      amp = 0;
    }

    float distance = radius + amp;
    pos.x = distance * cos(angle);
    pos.y = distance * sin(angle);
  }

  void updateAppearance() {
    opacity = map(amp, 0, 40, 40, 255);
    red = map(amp, 0, 40, 0, 96);
    green = map(amp, 0, 40, 0, 174);
    blue = map(amp, 0, 40, 0, 255);
  }

  void excite(float push) {
    amp = push;
  }

  void display() {
    fill(red, green, blue, opacity);
    ellipse(pos.x, pos.y, 14, 14);
    // fill(96, 174, 255);
    // ellipse(pos.x, pos.y, 3, 3);
  }
}
