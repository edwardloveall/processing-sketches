class HeartOrbiter extends Orbiter {
  HeartOrbiter(float _radius) {
    super(_radius);
    size += 4;
  }

  void display() {
    pushMatrix();
      translate(loc.x, loc.y, loc.z);
      shape(heart, 0, 0, size, size * 0.75);
    popMatrix();
  }
}
