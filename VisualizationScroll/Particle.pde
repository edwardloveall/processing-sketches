class Particle {
  PVector location, velocity;
  float life;
  float size;
  
  Particle (PVector _location, PVector _velocity, float _life) {
    location = _location;
    velocity = _velocity;
    life = _life;
    size = random(5, 15);
  }
  
  void update() {
    location.add(velocity);
    life = life < 0.001 ? 0 : life * 0.995;
  }
  
  void draw() {
    fill(life * 200f, 20, 0, life * 255f);
    ellipse(location.x, location.y, size, size);
    
    // stroke(life * 200f, 20, 0, life * 255f);
    // line(location.x, height * 1/6, location.x, height * 5/6);
  }
  
  void applyForce(PVector force) {
    velocity.add(force);
  }
  
  void removeForce(PVector force) {
    velocity.sub(force);
  }
  
  boolean alive() {
    if (life > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean inBounds() {
    if (location.x - size * 0.5 > width ||
        location.x + size * 0.5 < 0 ||
        location.y - size * 0.5 > height ||
        location.y + size * 0.5 < 0) {
      return false;
    } else {
      return true;
    }
  }
}
