class Planet {
  PVector loc;
  float size;
  
  Planet(PVector _loc, float _size) {
    loc = _loc;
    size = _size;
  }
  
  void display() {
    fill(255, 255, 0);
    
    pushMatrix();
      translate(loc.x, loc.y, loc.z);
      sphere(size);
    popMatrix();
  }
}