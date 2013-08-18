class Spark {
  float angle = radians(random(0, 360));
  float vel = random(0.01, 1);
  float aOff = random(1000);
  float aScfale = 100;
  
  float diameter = 3;
  float opacity = random(200, 255);
  float deathRate = 0.01;
  PVector loc = new PVector(width/2, height/2);;
  
//  Spark() {
//  }
  
  void update() {
    float aChange = noise(aOff * aScale);
    aChange *= 2;
    aChange -= 1;
    aOff++;
    loc.add(vel * sin(aChange + angle),
            vel * cos(aChange + angle), 0);
    
    opacity -= 2;
  }
  
  void draw() {
    fill(255, 255, 255, opacity);
    ellipse(loc.x, loc.y, diameter, diameter);
  }
  
  boolean inBounds() {
    if (loc.x + diameter*0.5 > width ||
        loc.x - diameter*0.5 < 0 ||
        loc.y + diameter*0.5 > height ||
        loc.y - diameter*0.5 < 0) {
      return false;
    } else {
      return true;
    }
  }
  
  boolean alive() {
    if (opacity > 0) {
      return true;
    } else {
      return false;
    }
  }
}
