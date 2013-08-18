class Particle {
  PVector location;
  float hue;
  float brightness;
  float destination;
  boolean inTransition;
  int maxStep;
  
  Particle (PVector _location, float _hue) {
    location = _location;
    hue = _hue;
    inTransition = false;
    maxStep = 5;
    brightness = random(0, 10);
  }
  
  void update () {
    addBrightness();
    draw();
  }
  
  void addBrightness () {
    destination = inTransition ? destination : random(0, 100);
    if (random(0, 100) > 90 || !inTransition) {
      if (Math.abs(destination - brightness) > maxStep) {
        inTransition = true;
        if (destination > brightness) {
          brightness += maxStep;
        } else {
          brightness -= maxStep;
        }
      } else {
        inTransition = false;
        brightness = destination;
      }
    }
  } // addBrightness
  
  void draw() {
    if (hue == Constants.GLOBAL) {
      fill(globalHue, 50, brightness);
    } else {
      fill(hue, 100, brightness);
    }
    rect(location.x, location.y, globalSquareWidth-1, globalSquareHeight-1);
  } // draw
}