class Circle {
  float angle, aVel;
  float radius;
  float amp;
  float opacity, hue, sat, bri;
  PVector pos;

  Circle() {
    angle = random(0, TWO_PI);
    aVel = TWO_PI * random(0.0003, 0.0008);
    radius = random(30, 100);
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
    hue = 10;
    sat = map(amp, 0, 40, 30, 80);
    bri = 80;
  }

  void excite(float push) {
    amp = push;
  }

  void display() {
    fill(hue, sat, bri, opacity);
    ellipse(pos.x, pos.y, 14, 14);
    // fill(96, 174, 255);
    // ellipse(pos.x, pos.y, 3, 3);
  }
}
