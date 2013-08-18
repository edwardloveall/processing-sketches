class Orbiter {
  PVector loc;
  float radius, theta, phi;
  float thetaVel, phiVel;
  float thetaOffset, phiOffset;
  float hue;
  int type;
  
  Orbiter(float _radius) {
    loc = new PVector();

    radius = _radius;
    theta = random(0, TWO_PI);
    phi = random(0, PI);
    
    thetaOffset = theta;
    phiOffset = phi;
    
    thetaVel = random(0.01, 0.03);
    phiVel = random(0.01, 0.08);
    
    hue = random(0, 1);
    
    type = floor(random(3));
    
    polar_to_cart();
  }
  
  void update() {
    theta += thetaVel;
    phi += phiVel;
    
    polar_to_cart();
  }
  
  void display() {
    fill(hue, 0.8, 1);
    pushMatrix();
      translate(loc.x, loc.y, loc.z);
      sphere(3);
    popMatrix();
  }
  
  void polar_to_cart() {
    // projection
    float p = radius * sin(phi);
    
    if (type == 0) {
      loc.z = radius * cos(phi);
      loc.y = p * sin(theta);
      loc.x = p * cos(theta);
    } else if (type == 1) {
      loc.z = p * sin(theta);
      loc.y = p * cos(theta);
      loc.x = radius * cos(phi);
    } else if (type == 2) {
      loc.z = p * cos(theta);
      loc.y = radius * cos(phi);
      loc.x = p * sin(theta);
    }
  }
}