import oscP5.*;
import netP5.*;
import supercollider.*;

import jklabs.monomic.*;

Monome m;
int mWidth = 8;
int mHeight = mWidth;

int mx = 0;
int my = 0;
int mt = 0;

Synth synth;

int tempo = 120;
int[] direction = {-1, 1};

void setup() {
  m = new MonomeOSC(this, "plinko");

  synth = new Synth("sine");
  synth.set("amp", 0.5);
  synth.set("freq", 80);
  synth.create();
}

void draw() {
  m.lightOff(mx % mWidth, my % mHeight);
  my++;
  mx += direction[(int)random(0, 2)];
  //mx = 0;
  //println(mt);
  if (mx < 0) {
    println("base");
    mx += mWidth;
  }
  m.lightOn(mx % mWidth, my % mHeight);

  synth.set("freq", 40 + ((int)mx * (random(50, 200) / ((int)my + 1))));
  
  delay(60000/tempo);
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
