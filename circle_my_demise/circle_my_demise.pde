/*
----------begin_max5_patcher----------
610.3ocyV1saaBCEG+Z3ovx2NVj+.Jvj1ivdBlplb.2TZA6HvQKcU8ceXCrl
zEHlFBgbgc3fs4+4mOG6yqtNv0x87JH3afeBbbd00wwXRavo8YGXAaeRNqxL
Lnf+a45mfdMuRw2qLlel+RmssLUxiYhM+pjmnZVZRDcExCDfLswqB7.33UHv
8sSIK0rH0K7WwAcqyCRgpJ6Ob8qpGbqUwthLQNWYTC5fgJXElgB+gTvRjv2G
ubmpaB9sVaLodYKuQfvLgB5cpNv85Y7lqqtwyRHUvqpXa3+Gk99I9M.1nHrF
XTTftCqQVcWXOfyeDfiLVvg6CbeN.0STTEOGPI.z4CkB8MgRl1dCkHifH3wR
DZeDYMSrQG8z0OoDJQkmI.ACAHjIKKjna8iFDP3qIfHVjqMknYaoYgOa1D0j
MQGlLnqIYPSmSKjJd8JCvmOhfFD2d76.Nd7H7a5MzuKXOy09N.SBAXDxB2uY
eONbH2O5Z598lP7PtjYRIZ9ymJoPI2rImedLfQlyOii5ZOEFBgCEma4MCSc9
cAWUJ0tgEa1Dpo6tfg1ro2jKLMWKLkb4K0mrYAQBuyjEPFp3KxMgHScfRISj
JKpq1zBpzTAwvmIhWFTwHMX80+erfci6oseLppj6JS5Vst5g.3+4go7JUlfo
xjhCGTcYjf2wviYoobwg0ZWjktUVKtVQzyFmsZJ7nuVORhLqR5CetSqovwII
RrIuq4xGBJt6gKUpAKO7YC8zkWMm6n9KPMgm9nrKTRQVb7P7QiYNTDxBEsrh
tilUEQsI1dwclNcdS1rPQWxoj0O7l6eAa8jZ9A
-----------end_max5_patcher-----------
*/

import geomerative.*;
import themidibus.*;

RPath shp1;
RPoint start;
MidiBus myBus;
RPoint cp1;
RPoint cp2;

float i = 0;
float cp = 20;

int oldX;
int oldY;
int pitchCoef;

int cpx1, cpx2, cpy1, cpy2, distX, distY;

void setup() {
  size(400, 400);
  smooth();
  background(0);
  stroke(255);
  strokeWeight(3);
  noFill();
  
  RG.init(this);
  
  oldX = width/2;
  oldY = height/2;
  pitchCoef = height/127;
  
  start = new RPoint(oldX, oldY);
  shp1 = new RPath(start);
  cp1 = new RPoint(oldX, oldY);
  cp2 = new RPoint(oldX, oldY);
  //shp1.addLineTo(width*.75, height/2);
  
  //MidiBus.list();
  
  //myBus = new MidiBus(this, "USB Uno MIDI Interface - USB Uno MIDI Interface", "USB Uno MIDI Interface - USB Uno MIDI Interface");
  myBus = new MidiBus(this, 0, 0);
  myBus.sendControllerChange(1, 5, 1);
}

void draw() {
  background(0);
  translate(i, 0);
  shp1.draw();
  i -= 1; // move left
  //quad(width/2-i, 0, width/2-i, height, width-i, height, width-i, 0);
}

void noteOn(int channel, int pitch, int velocity) {;
  distX = (int)(width - i) - oldX;
  distY = pitch*pitchCoef - oldY;
  cpx1 = oldX + (int)(distX * .25); //25% of distance from last pointx to current point x
  cpy1 = oldY; // last y point
  cpx2 = oldX + (int)(distX * .75); //75% of distance from last pointx to current point x
  cpy2 = pitch; // current y point
  
  shp1.addBezierTo(cpx1, cpy1, cpx2, cpy2, width - (int)i, pitch*pitchCoef);
  oldX = width - (int)i;
  oldY = pitch*pitchCoef;
  println(oldY);
}

void mousePressed() {
  //shp1.addQuadTo(mouseX+cp, mouseY+cp, mouseX-i, mouseY);
  //shp1.addQuadTo(oldX-i, mouseY, mouseX-i, mouseY);
  distX = mouseX - oldX;
  distY = mouseY - oldY;
  cpx1 = oldX + (int)(distX * .25) - (int)i;
  cpy1 = oldY;
  cpx2 = oldX - (int)(distX * .25) - (int)i;
  cpy2 = mouseY;
  //cp1 = RPoint(cpx1, cpy1);
  //cp2 = RPoint(cpx2, cpy2);
  //shp1.addLineTo(cpx1, cpy1);
  //shp1.addLineTo(oldX, oldY);
  shp1.addBezierTo(cpx1, cpy1, cpx2, cpy2, mouseX - (int)i, mouseY);
  //shp1.addLineTo(cpx2, cpy2);
  //shp1.addLineTo(mouseX - (int)i, mouseY);
  oldX = mouseX;
  oldY = mouseY;
}
