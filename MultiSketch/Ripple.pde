class Ripple { // The ripple class
  float x, y; // 
  float diameter, alph;
  boolean on = false;
  color colors;

  void xy(float xpos, float ypos, color shade) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
    colors = shade;
    
  }

  void resize() {
    if (on == true) {
      if (diameter < 200) {
      diameter++;
      alph = abs((diameter*1.275)-255);
      } else {
        on = false;
      }
    }
  }

  void display() {
    noFill();
    stroke(c[colors], alph);
    strokeWeight(3);
    ellipse(x, y, diameter, diameter);
  }
}