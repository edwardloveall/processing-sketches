class Particle {
  PVector location;
  float size;
  float shade;
  
  Particle (PVector _location, float _size, float _shade) {
    location = _location;
    size = _size;
    shade = _shade;
  }
  
  void update() {
    float speed = size/20;
    location.x -= speed;
  }
  
  void draw() {
    fill(shade, 127);
    ellipse(location.x, location.y, size, size);
  }
  
  boolean inBounds() {
    float rad = size/2;
    float x = location.x;
    float y = location.y;
    if (x+rad < width || x-rad > 0 || y+rad < height || y-rad < 0) { // true if inside bounds
      return true;
    } else {
      return false;
    }
  }
}
