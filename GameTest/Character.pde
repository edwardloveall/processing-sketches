class Character {
  PVector pos;
  PVector vel;
  float charSize = 20;

  Character (PVector _pos, PVector _vel) {
    pos = _pos;
    vel = _vel;
  }

  void update() {
    vel.mult(0.91);
    pos.add(vel);

    if (pos.x - charSize/2 > width) {
      pos.x = 0 - charSize/2;
    } else if (pos.x + charSize/2 < 0) {
      pos.x = width + charSize/2;
    } else if (pos.y - charSize/2 > height) {
      pos.y = 0 - charSize/2;
    } else if (pos.y + charSize/2 < 0) {
      pos.y = height + charSize/2;
    }
  }

  void draw() {
    noStroke();
    fill(0);
    ellipse(pos.x, pos.y, charSize, charSize);
  }
}
