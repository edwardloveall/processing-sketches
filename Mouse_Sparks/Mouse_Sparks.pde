Spark[] sparks = new Spark[10];

void setup() {
  background(0);
  stroke(255);
  smooth();
  size(400, 400);
  frameRate(30);
  noCursor();
  for (int i=0; i < sparks.length; i++) {
    sparks[i] = new Spark();
  }
}

void draw() {
  background(0);
  
  for (int i=0; i < sparks.length; i++) {
    sparks[i].update();
    sparks[i].display();
  }
}

class Spark {
  PVector location;
  
  Spark() {
  }
  
  void update() {
    location = new PVector(random(-20, 20), random(-20, 20));
  }
  
  void display() {
    line(mouseX, mouseY, mouseX + location.x, mouseY + location.y);
  }
}