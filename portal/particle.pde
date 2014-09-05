class Particle {
  PVector pos;
  float vel, aVel;
  float radius, angle;
  float opacity;

  Particle(int randoms_index) {
    angle = randoms[randoms_index][0];
    radius = randoms[randoms_index][1];
    pos = pointFromAngle(angle, radius);
    vel = 0f;
    aVel = 0.01;
    opacity = 255f;
  }

  void update() {
    vel += gravity;
    radius -= vel;
    radius = max(radius, 0);
    angle -= aVel;
    pos = pointFromAngle(angle, radius);
    opacity = map(radius, 0, 40, 0, 255);
  }

  void display() {
    noStroke();
    fill(252, 32, 28, opacity);
    rect(pos.x, pos.y, 8, 8);
  }

  boolean isAlive() {
    if (radius > 0) {
      return true;
    } else {
      return false;
    }
  }

  PVector pointFromAngle(float a, float r) {
    return new PVector(r * cos(a), r * sin(a));
  }
}
