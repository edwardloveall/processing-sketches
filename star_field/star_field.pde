import processing.opengl.*;

Stars[] sparkle;

int stars = 1;
int currentstar = 0;

//color colors[] = { color(255, 255, 230), 

void setup() {
  size (300, 300, OPENGL);
  background(0);
  smooth();
  noStroke();

  sparkle = new Stars[stars];
  for (int i = 0; i < stars; i++) {
    sparkle[i] = new Stars();
  }
}

void draw() {
  background(0);
  directionalLight(255, 255, 255, 0, 0, -1);
  lights();
  for (int i = 0; i < stars; i++) {
    sparkle[i].move(); // Change the parameters
    sparkle[i].display(); // Actually draw 'em
  }
}

void mousePressed() {
  sparkle[currentstar].xy(mouseX, mouseY); // tell the upcoming star where it should be made
  currentstar++; // advance to the next star int the array
  if (currentstar >= stars) { // Reset if we max out stars
    currentstar = 0;
  }
}

class Stars {
  float x, y;
  float z = -100;
  boolean on = false;

  void xy(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
  }

  void move() {
    if (on == true) {
      if (z < 0) {
        z++;
      }
    } 
    else {
      on = false;
    }
  }

  void display() {
    translate(0, 0, z);
    fill(255, 255, 230);
    sphere(7);
  }
}

