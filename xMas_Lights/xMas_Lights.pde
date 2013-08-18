import oscP5.*;
import netP5.*;
import jklabs.monomic.*;

Monome m;
int mWidth = 8;
int mHeight = mWidth;

int mx;
int my;
float wait;

void setup() {
  m = new MonomeOSC(this, "xmas");
}

void draw() {
  mx = (int)random(mWidth);
  my = (int)random(mHeight);
  m.lightOn(mx, my);
  
  wait = random(125, 500);
  delay(wait);
  
  mx = (int)random(mWidth);
  my = (int)random(mHeight);
  m.lightOff(mx, my);
  
  wait = random(125, 500);
  delay(wait);
}


void stop()
{
  m.lightsOff();
}
