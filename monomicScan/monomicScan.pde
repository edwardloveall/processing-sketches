import jklabs.monomic.*;
import oscP5.*;
import netP5.*;

Monome m;

int index = 0;
int col = 0;

void setup() {
  m = new MonomeOSC(this);
}

void draw() {
  m.setCol(col%8, (byte)index);
  if (index < 255) {
    index++;
  } else {
     m.setCol(col%8, (byte)0);
    index = 0;
    col++;
  }
}

void stop() {
  m.lightsOff();
}
