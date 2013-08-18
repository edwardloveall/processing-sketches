import processing.opengl.*;

float posx = 0;
float posz = HALF_PI;
float pos2x = 0;
float pos2z = PI+HALF_PI;
float i = 0;

void setup() {
  size (300, 300, OPENGL);
  background(0);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  directionalLight(255, 255, 255, 0.5, 0, -1);
  translate(posx+width/2, height/2, posz);
  ambientLight(255, 255, 255);
  ambient(0, 127, 255);
  sphere(30);
  translate(pos2x-posx, 0, pos2z-posz);
  //ambientLight(255, 255, 255);
  //ambient(127, 255, 0);
  ambientLight(153, 102, 0);
  ambient(51, 26, 0);
  sphere(30);
  i += (TWO_PI)/600;
  posx = sin(i)*60;
  posz = sin(i+90)*60;
  pos2x = sin(i+180)*60;
  pos2z = sin(i+270)*60;
}
