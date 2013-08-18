class Firefly {
  PVector location;
  PVector velocity;
  float decayRate; // expressed in frames until death
  float opacity;
  float size;

  Firefly(PVector _location, float _decayRate) {
    location = _location;
    velocity = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    decayRate = 255 / _decayRate;
    opacity = 255;
    size = random(3, 15);
  }

  void update() {
    location.add(velocity);
    opacity -= decayRate;
    opacity = Math.max(1, opacity);

    if (debug) {
      /*println("opacity: " + opacity + " decayRate: " + decayRate);*/
    }
  }

  void draw() {
    int offsetOpacity = (int)opacity << 24;
    fill(globalColor+offsetOpacity); // shift the opacity value (0 - 255) by 24 bits so it's in the alpha spot
    if (debug) {
      int alpha = (g.fillColor >> 24) & 0xFF;
      int red = (g.fillColor >> 16) & 0xFF;
      int green = (g.fillColor >> 8) & 0xFF;
      int blue = g.fillColor & 0xFF;
      /*println("Alpha: " + alpha + " Red: " + red + " Green: " + green + " Blue: " + blue );*/
      /*println("offsetOpacity: " + offsetOpacity);*/
    }
    ellipse(location.x, location.y, size, size);
  }

  Boolean alive() {
    if (opacity > 1) {
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
