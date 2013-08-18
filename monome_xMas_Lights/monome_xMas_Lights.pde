/*
xmas lights by Edward Loveall
edward@edwardloveall.com

See notes below for settings

prefix is /xmas
*/

import oscP5.*;
import netP5.*;
import jklabs.monomic.*;

Monome m;
int mWidth = 8; // set your monome's width here
int mHeight = 8; // set your monome's width here

Lights[] light;
int maxLights = (mHeight * mWidth);
int currentLight;

int wait;

void setup() {
  m = new MonomeOSC(this, "xmas"); // prefix is here
  
  light = new Lights[maxLights];
  for (int i = 0; i < maxLights; i++) {
    light[i] = new Lights();
  }
}

void draw() {
  if ((int)random(25) == 1) { // just light up stuff randomly. the bigger the random number, the less likely lights will appear
    light[currentLight].lightOn();
    currentLight++;
    if (currentLight >= maxLights) {
      currentLight = 0;
    }
  }
  
  for (int i = 0; i < maxLights; i++) {
   if (light[i].checkDuration() < millis()) {
     light[i].lightOff(); 
    }
  }
}

class Lights {
  int mx, my;
  int initTime;
  int duration = (int)random(2000, 20000); // this is how long lights will stay on for set in milliseconds. Currently it's 2-20 seconds.
  
  void lightOn() {
    initTime = millis();
    mx = (int)random(mWidth);
    my = (int)random(mHeight);
    m.lightOn(mx, my);
  }
  
  void lightOff() {
    m.lightOff(mx, my);
  }
  
  int checkDuration() {
    return duration + initTime;
  }
}

void stop()
{
  m.lightsOff();
}
