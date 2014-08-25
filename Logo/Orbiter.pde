class Orbiter {
  PVector loc;
  float radius, theta, phi;
  float thetaOffset;
  float size;

  Orbiter(float _radius) {
    loc = new PVector();

    radius = _radius;
    theta = random(0, TWO_PI);
    phi = random(0.3, PI - 0.3);

    size = random(2, 6);
  }

  void update() {
    float projection = radius * sin(phi);
    theta += 0.05;
    loc.z = projection * cos(theta);
    loc.y = radius * cos(phi);
    loc.x = projection * sin(theta);
  }

  void display() {
//    fill(2, 84, map(loc.z, -140, 140, 60, 100));
    pushMatrix();
      translate(loc.x, loc.y, loc.z);
      sphere(size);
    popMatrix();
  }
}
