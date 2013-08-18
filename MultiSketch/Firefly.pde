class Firefly {
  PVector location;
  PVector velocity;
  float decayRate; // expressed in frames until death
  float opacity;
  float size;
  float saturation;
  
  Firefly(float x, float y, int _decayRate) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    decayRate = 255 / (_decayRate + random(-30, 0));
    opacity = 255;
    size = random(3, 15);
    saturation = random(0, 255);
  }
  
  void update() {
    opacity -= decayRate;
    location.add(velocity);
  }
  
  void draw() {
    fill(saturation, 127+saturation/2, 255, opacity);
    ellipse(location.x, location.y, size, size);
  }
  
  Boolean alive() {
    if (opacity > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  Boolean inBounds() {
    if (location.x - size/2 > width || location.x + size/2 < 0 ||
        location.y - size/2 > height || location.y + size/2 < 0) {
      return false;
    } else {
      return true;
    }
  }
}