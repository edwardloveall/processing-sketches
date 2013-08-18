Ripple[] rip; // Declare the object array
int numRipples = 50; // Max number of ripples
int currentRipple = 0; // To keep track
color bg = 0;
color strk = 255;

void setup() {
  size(500, 500);
  smooth();
  stroke(255);
  strokeWeight(3);
  noFill();
  rip = new Ripple[numRipples]; // Create the object
  for (int i = 0; i < numRipples; i++) {
    rip[i] = new Ripple();
  }
}

void draw() {
  background(bg);
  for (int i = 0; i < numRipples; i++) {
    rip[i].resize(); // Change the parameters
    rip[i].display(); // Actually draw 'em
  }
}

void mousePressed() {
  rip[currentRipple].xy(mouseX, mouseY); // tell the upcoming ripple where it should be made
  currentRipple++; // advance to the next ripple int the array
  if (currentRipple >= numRipples) { // Reset if we max out numRipples
    currentRipple = 0;
  }
}

class Ripple { // The ripple class
  float x, y; // 
  float diameter, alph;
  boolean on = false;

  void xy(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
    
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
    stroke(strk, alph);
    strokeWeight(3);
    ellipse(x, y, diameter, diameter);
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    if (bg == 0) {
      bg = 255;
      strk = 0;
    } else {
      bg = 0;
      strk = 255;
    }
      draw();
  }
}
