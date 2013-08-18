import oscP5.*;
import netP5.*;

int oscPort = 3030;
OscP5 oscP5;

ArrayList vectorArray;

int monomeWidth = 16;
int monomeHeight = 8;
int sizeScale = 50;

void setup() {
  size(monomeWidth*sizeScale, monomeHeight*sizeScale); // 800 x 400
  smooth();
  noStroke();
  
  oscP5 = new OscP5(this, oscPort);
  
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

void addFirefly(int count, PVector pos) {
  for(int i = count - 1; i >= 0; i--) {
    float xTemp = (pos.x * sizeScale) + round(random(0, 49));
    float yTemp = (pos.y * sizeScale) + round(random(0, 49));
    
    vectorArray.add(new Firefly(xTemp, yTemp, 100));
  }
}

void addFireflyRow(int count, int xData, int yPos) {
  for(int i = 0; i < monomeWidth; i++) {
    if((xData & (int)Math.pow(2, i)) > 0) {
      for (int j = count - 1; j >= 0; j--) {
        float xTemp = (i * sizeScale) + round(random(0, 49));
        float yTemp = (yPos * sizeScale) + round(random(0, 49));
        
        vectorArray.add(new Firefly(xTemp, yTemp, 100));
      }
    }
  }
}

void addFireflyCol(int count, int xPos, int yData) {
  for(int i = 0; i < monomeWidth; i++) {
    if((xData & (int)Math.pow(2, i)) > 0) {
      for (int j = count - 1; j >= 0; j--) {
        float xTemp = (i * sizeScale) + round(random(0, 49));
        float yTemp = (yPos * sizeScale) + round(random(0, 49));
        
        vectorArray.add(new Firefly(xTemp, yTemp, 100));
      }
    }
  }
} 

void oscEvent(OscMessage msg) {
  int state = msg.get(2).intValue();
  if (state == 1) {
    int x = msg.get(0).intValue();
    int y = msg.get(1).intValue();
    int index = y * monomeWidth + x;
    if(msg.checkAddrPattern("/grid/key")) {
      addFirefly(10, new PVector(x, y));
    } else if(msg.checkAddrPattern("/grid/led/row")) {
      addFireflyRow(10, x, y);
    } else if(msg.checkAddrPattern("/grid/led/col")) {
      addFireflyRow(10, x, y);
    }
  }
}

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
