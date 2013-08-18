import oscP5.*;
import netP5.*;

import jklabs.monomic.*;

Monome m;
int mWidth = 8;
int mHeight = 8;

void setup() {
  m = new MonomeOSC(this);
  //m.setDebug(true);
  frameRate(10);
}

void draw() {
}

void monomePressed(int x, int y) {
  m.lightsOff();
  m.lightOn((int)x, (int)y);
}

void stop()
{
m.lightsOff();
}
