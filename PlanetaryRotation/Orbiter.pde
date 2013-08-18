class Orbiter extends Planet {
  Planet base;
  float distance, baseDist;
  float speed;
  color tint;
  
  Orbiter(Planet _base, float _size, float _distance, float _speed) {
    super(new PVector(0, _base.loc.y, 0), _size);
    base = _base;
    baseDist = size + base.size;
    distance = _distance + baseDist;
    speed = _speed;
    tint = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  void update() {
    float time = frameCount / fps;
    
    loc.x = base.loc.x + sin(time * speed) * distance;
    loc.z = base.loc.z + cos(time * speed) * distance;
  }
  
  void display() {
    fill(tint);
    
    pushMatrix();
      translate(loc.x, loc.y, loc.z);
      sphere(size);
    popMatrix();
  }
}