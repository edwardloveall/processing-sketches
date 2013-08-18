import promidi.*; //   http://www.texone.org/promidi/

MidiIO midiIO;
MidiOut midiOut;


Ripple[] rip; // Declare the object array
int numRipples = 50; // Max number of ripples
int currentRipple = 0; // To keep track
color bg = 0;

// Color array
int c1 = 255;
int c2 = 127;
color[] c = {
  color(c1, c2, 0), color(c1, 0, c2), color(c2, c1, 0), color(c2, 0, c1), color(0, c2, c1) }; //Colors
//color(255), color(168), color(126), color(84), color(42) }; //Greys

int[] notelist0 = { 
  60, 64, 67, 72, 59, 48 };
int[] notelist1 = { 
  60, 65, 67, 72, 57, 53 };
int chord = 0;
int bass = 5;

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

  midiIO = MidiIO.getInstance(this);
  // midiIO.printDevices(); // Print list of devices to use as midiouts
  midiOut = midiIO.getMidiOut(0,0);
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
  rip[currentRipple].playnote(which);
}

class Ripple { // The ripple class
  float x, y; // 
  float diameter, alph;
  boolean on = false;
  color colors;
  Note note;

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
      } 
      else {
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

  void playnote(int pitch) {
    if (chord == 0) {
    note = new Note(notelist0[pitch], 80, 500);
    } else if (chord == 1) {
    note = new Note(notelist1[pitch], 80, 500);
    }
    midiOut.sendNote(note);
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    if (bg == 0) {
      bg = 255;
      chord = 1;
      rip[currentRipple].playnote(bass);
    } 
    else {
      bg = 0;
      chord = 0;
      rip[currentRipple].playnote(bass);
    }
    draw();
  }
}

