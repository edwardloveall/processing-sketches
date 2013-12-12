class Ball {
  PVector pos;
  float size, size_target;
  float velocity, acceleration;

  Ball(PVector _pos) {
    pos = _pos;
    size = 0;
    velocity = 10;
    size_target = random(30, 90);
    acceleration = 0;
  }

  void update() {
    acceleration = size_target - size;
    acceleration *= 0.2;
    acceleration = (abs(acceleration) < 0.00001) ? 0 : acceleration;
    velocity += acceleration;
    velocity = constrain(velocity, -10, 10);
    velocity *= 0.9;
    size += velocity;
  }

  void display() {
    ellipse(pos.x, pos.y, size, size);
  }
}
