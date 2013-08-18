class Particle {
  PVector location, velocity;
  float life;
  float size;
  
  Particle (PVector _location, PVector _velocity, float _life) {
    location = _location;
    velocity = _velocity;
    life = _life;
    size = 2;
  }
  
  void update() {
    location.add(velocity);
    life -= 0.001;
  }
  
  void draw() {
    /*fill(255, life * 255f);
    ellipse(location.x, location.y, 2, 2);*/
    
    stroke(255, life * 255f);
    line(location.x, location.y, location.x + velocity.x * 5, location.y + velocity.y * 5);
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
    if (location.x + size*0.5 > width || location.x - size*0.5 < 0 || location.y + size*0.5 > height || location.y - size*0.5 < 0) {
      return false;
    } else {
      return true;
    }
  }
}