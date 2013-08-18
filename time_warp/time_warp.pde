Bullet[] bang;
int maxBangs = 10;
int currentBang = 0;
int x = 1;

void setup() {
  size(500, 500);
  smooth();
  stroke(255);
  strokeWeight(3);
  noFill();
  
  bang = new Bullet[maxBangs]; // Create the object
  for (int i = 0; i < maxBangs; i++) {
    bang[i] = new Bullet();
  }
}

void draw() {
  fill(0, 70);
  rect(0, 0, width, height);
  for (int i = 0; i < maxBangs; i++) {
    bang[i].move();
    bang[i].display();
  }
}

void mousePressed() {
  int hght = int(random(height));
  float distance = random(2);
  bang[currentBang].create(hght, distance);
  currentBang++;
  if (currentBang >= maxBangs) {
    currentBang = 0;
  }
}

class Bullet {
  float y, m;
  float x = width;
  boolean on = false;
  
  void create(int ypos, float move) {
    y = ypos;
    x = width;
    m = move;
    on = true;
  }
  
  void move() {
    if (on == true) {
      x -= m;
    } else {
      on = false;
    }
  }
  
  void display() {
    fill(255);
    ellipse(x, y, 20, 10);
  }
}
