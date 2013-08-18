import com.cycling74.processing.*;
import com.cycling74.max.*;
MaxProcessingObject maxObj;

ArrayList floaters;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(30);
  
  floaters = new ArrayList();
  for (int i = 0; i<50; i++) {
    addFloater();
  }
  
  maxObj = MaxProcessingObject.get(this);
  maxObj.declareIO(1, 1);
  maxObj.createInfoOutlet(false);
}

void draw() {
  background(16);
  
  for (int i = floaters.size() - 1; i >= 0; i--) {
    Floater theFloater = (Floater)floaters.get(i);
    
    // remove the object if it has died;
    if (theFloater.inBounds()) {
      theFloater.update();
      theFloater.draw();
    } else {
      floaters.remove(i);
      addFloater();
      continue;
    }
  }
  
  maxObj.jitter(0);
}

void addFloater() {
  float posX = random(0, width);
  float posY = random(0, height);
  color randColor = color(random(0, 255), random(0, 255), random(0, 255));
  floaters.add(new Floater(posX, posY, randColor));
}

class Floater {
  PVector location;
  PVector velocity;
  float size;
  color c;
  
  Floater(float x, float y, color _c) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    size = random(3, 15);
    c = _c;
  }
  
  void update() {
    location.add(velocity);
  }
  
  void draw() {
    fill(c);
    ellipse(location.x, location.y, size, size);
  }
  
  Boolean inBounds() {
    if (location.x - size/2 > width || location.x + size/2 < 0 ||
        location.y - size/2 > height || location.y + size/2 < 0) {
      return false;
    } else {
      return true;
    }
  } // inBounds
}