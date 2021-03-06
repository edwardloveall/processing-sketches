/*Ripple[] rip; // Declare the object array
int numRipples = 50; // Max number of ripples
int currentRipple = 0; // To keep track

int c1 = 255; // Color array
int c2 = 127;
color[] c = {
  color(c1, c2, 0), color(c1, 0, c2), color(c2, c1, 0), color(c2, 0, c1), color(0, c2, c1), };*/

void setup() {
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
  int which = round(random(4)); // pick a color, any color (or the number associateing to that color in the array)
  rip[currentRipple].xy(mouseX, mouseY, which); // tell the upcoming ripple where it should be made and what color it should be
  currentRipple++; // advance to the next ripple int the array
  if (currentRipple >= numRipples) { // Reset if we max out numRipples
    currentRipple = 0;
  }
}