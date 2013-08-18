import com.cycling74.processing.*;
import com.cycling74.max.*;
MaxProcessingObject maxObj;

ArrayList rects;
color[] scheme = {color(0 ,17 ,17), color(17, 34, 17), color(85, 85, 0), color(51, 51, 34), color(119, 136, 85), color(17, 51 ,17), color(102, 85, 0), color(51, 68, 0), color(119, 170, 17)};

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  frameRate(30);
  
  rects = new ArrayList();
  
  for (int i = 0; i < 30; i++) {
    rects.add(createSquare());
  }
  
  maxObj = MaxProcessingObject.get(this);
  maxObj.declareIO(2, 1);
  maxObj.createInfoOutlet(false);
}

Square createSquare() {
  float theWidth = random(width/3, width/2);              // width
  float theHeight = random(height/5, height/10);           // height
  color theColor = scheme[int(random(scheme.length-1))];  // color
  PVector theVel = new PVector(random(-5, -1), 0);       // velocity
  PVector thePos = new PVector(width, random(0-(theHeight * 0.025), height-(height * 0.025))); // position
  
  return new Square(theWidth, theHeight, theColor, theVel, thePos);
}

void draw() {
  background(0);
  
  for (int i = rects.size()-1; i > 0; i--) {
    Square aRect = (Square)rects.get(i);
    aRect.update();
    
    if (aRect.inBounds()) { // check bounds
      aRect.draw();
    } else {
      rects.remove(i);
      rects.add(createSquare());
    }
  }
  
  maxObj.jitter(0);
}

class Square {
  color sColor;
  float sWidth, sHeight;
  PVector velocity, position;
  
  Square(float _sWidth, float _sHeight, color _sColor, PVector _velocity, PVector _position) {
    sWidth = _sWidth;
    sHeight = _sHeight;
    sColor = _sColor;
    velocity = _velocity;
    position = _position;
  }
  
  void update() {
    position.add(velocity);
  }
  
  void draw() {
    fill(sColor);
    rect(position.x, position.y, sWidth, sHeight);
  }
  
  boolean inBounds() {
    if ( position.x > width || position.x + sWidth <= 0
      || position.y > height || position.y + sHeight <= 0) {
      return false;
    } else {
      return true;
    }
  }
}