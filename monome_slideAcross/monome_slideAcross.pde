import oscP5.*;
import netP5.*;
import supercollider.*;

import jklabs.monomic.*;

Monome m;
int mWidth = 8;
int mHeight = mWidth;

int mx = 0;
int my = 0;

Synth synth;

void setup() {
  frameRate(10);
  m = new MonomeOSC(this);

  synth = new Synth("sine");
  synth.set("amp", 0.5);
  synth.set("freq", 80);
  synth.create();
}

void draw() {
  m.lightOff(mx % mWidth, my);
  mx++;
  m.lightOn(mx % mWidth, my);

  synth.set("freq", 40 + ((int)mx * (random(50, 200) / ((int)my + 1))));
}

void monomePressed(int inx, int iny) {
  m.lightsOff();
  mx = inx;
  my = iny;
}

void stop()
{
  m.lightsOff();
  synth.free();
}
