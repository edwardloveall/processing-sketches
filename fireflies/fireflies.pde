/*
* Click and drag to create fireflies
* */

ArrayList vectorArray;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  
  vectorArray = new ArrayList();
}

void draw() {
  background(16);
  
  for (int i = vectorArray.size() - 1; i >= 0; i--) {
    Firefly theVector = (Firefly)vectorArray.get(i);
    
    // remove the object if it has died;
    if (theVector.alive() && theVector.inBounds()) {
      theVector.update();
      theVector.draw();
    } else {
      vectorArray.remove(i);
      continue;
    }
  }
}

void addVector() {
  if (mousePressed) {
    float x = mouseX + random(-20, 20);
    float y = mouseY + random(-20, 20);
    vectorArray.add(new Firefly(x, y, 100));
  }
}

void mouseDragged() { addVector(); }
void mousePressed() { addVector(); }

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
