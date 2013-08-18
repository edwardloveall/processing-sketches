import gifAnimation.*;

float t = 0.1;
int frame = 0;
int rectSize = 1;
int rectOffset;
boolean recording = false;
int take = 1;
PImage back;
GifMaker gifExport;

void setup() {

//  size(200, 200, P2D);  // gif size
  size(displayWidth, displayHeight, P2D);  // display size
  rectMode(CENTER);
  rectOffset = width/4;
  back = loadImage("blackboard2.jpeg");
  background(50);
  fill(200, 100);
  stroke(10, 100);

  gifExport = new GifMaker(this, "export.gif", 5);
  gifExport.setRepeat(0);
  gifExport.setDelay(0);
}

int theta = 0;
int theta2 = 1;
int theta3 = 2;

void draw() {
  image(back, 0, 0);
  theta++;
  theta2 += 2;
  theta3 += 3;

  pushMatrix();
    fill(random(255), random(255), 255, 50);
    translate((width/2)+rectOffset, height/2);
    rotate(theta);
    rectSize = gen();
    rect(200, 0, rectSize, rectSize);
  popMatrix();

  pushMatrix();
    fill(random(255), random(255), 255, 50);
    translate((width/2)-rectOffset, height/2);
    rotate(theta2);
    rectSize = gen();
    rect(100, 0, rectSize, rectSize);
  popMatrix();

  pushMatrix();
    fill(random(255), random(255), 255, 50);
    translate((width/2), height/2);
    rotate(theta3);
    rectSize = gen();
    rect(300, 0, rectSize, rectSize);
  popMatrix();


  if(recording) {
      gifExport.setDelay(1);
      gifExport.addFrame();
  }
}

int gen() {
  t = t + 0.001;
  int x = (int)map(sin(noise(t)*500), -2, 2, 0, width-20);
  return x;
}

void mousePressed() {
  recording = !recording;
  take += 1;
}

void keyPressed() {
  if(keyCode == ENTER) {
    gifExport.finish();
  }
}
