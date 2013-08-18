// Point Snake Generator by Edward Loveall
// Just make some points run around the screen in different colors at random
// Click to reset
// http://www.edwardloveall.com/

int[] position = new int[2];
int b = 1; //Point Bias (for teting)

// color arrary
int c1 = 255;
int c2 = 127;
int divs = 4;
color[] c = {
  color(c1, c2, 0), color(c1, 0, c2), color(c2, c1, 0), color(c2, 0, c1), color(0, c2, c1), };

void setup() {
  size(401, 401); //For Prettyness, must be a (multipul of 4)+1
  background(0);
  int o = 1; //overall start bias (for testing)
  position[0] = (width/2)+o;
  position[1] = (height/2)+o;
}

void draw() {
  int colors = int(random(4));
  strokeWeight(3);
  stroke(c[colors]);
  frameRate(30);
  point(position[0]+b, position[1]+b);

  if (position[0] > 4 && position[0] <= width-4) {
    position [0] += round(random(-1, 1))*4;
  } 
  else {
    if (position[0] > 4) {
      position[0] -= 4;
    } 
    else {
      position[0] += 4;
    }
  }

  if (position[1] > 4 && position[1] <= height-4) {
    position [1] += round(random(-1, 1))*4;
  } 
  else {
    if (position[1] > 4) {
      position[1] -= 4;
    } 
    else {
      position[1] += 4;
    }
  }
  stroke(255);
  point(position[0]+b, position[1]+b);
}

void mousePressed () {
  setup();
}

// For swhifting with arrow keys
void keyPressed() {
int mv = (3)*4; // (x)*4 units in multipuls of 4 px
  if (key == CODED) {
    if (keyCode == UP) {
      position[1] -= mv;
    }
    if (keyCode == DOWN) {
      position[1] += mv;
    }
    if (keyCode == LEFT) {
      position[0] -= mv;
    }
    if (keyCode == RIGHT) {
      position[0] += mv;
    }
  }
}
