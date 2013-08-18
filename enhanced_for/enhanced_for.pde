Thingy[] things = new Thingy[40];

void setup() {
  size(700, 400);
  smooth();
  strokeWeight(2);
  
  for (int i = 0; i < things.length; i++) {
    things[i] = new Thingy();
  }
}

void draw() {
  background(255);

  ////////////////
  for(Thingy t : things) {
    t.update();
    t.display();
  }
  ////////////////

}

class Thingy {
  PVector location, center;
  float distance, angle;
  
  Thingy() {
    location = new PVector(0, 0);
    center = new PVector(width/2, height/2);
    distance = 140;
    angle = random(TWO_PI);
  }
  
  void update() {
    location.x = center.x + distance * cos(angle);
    location.y = center.y + distance * sin(angle);
    angle += 0.01;
  }
  
  void display() {
    ellipse(location.x, location.y, 20, 20);
  }
}