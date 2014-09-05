class Ring {
  float size, opacity;
  float shrinkVelocity;
  float maxSize = 200;

  Ring() {
    size = 200f;
    opacity = 255f;
    shrinkVelocity = 1;
  }

  void update() {
    size -= shrinkVelocity;
    opacity = map(size, maxSize * 0.1, maxSize, 0, 255);
  }

  void display() {
    stroke(191, 46, 68, opacity);
    ellipse(0, 0, size, size);
  }

  boolean isAlive() {
    if (size > 0) {
      return true;
    } else {
      return false;
    }
  }
}
